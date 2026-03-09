# Channel Health Model

This document defines a simple channel health model for chat-connected agents such as OpenClaw.

The goal is to prevent the worst operator experience:
- the bot looks online
- some actions still work
- but inbound messages or critical paths are silently broken

## Why this exists

A channel should not be treated as a single `healthy/unhealthy` switch.
For practical operations, health should be separated into distinct surfaces.

Recommended minimum surfaces:
- **Inbound** — can the agent receive user messages?
- **Outbound** — can the agent send replies or notifications?
- **Auth** — are tokens/session credentials valid and accepted?
- **Transport mode** — is the active transport path (`polling` or `webhook`) configured and behaving as expected?
- **Degraded** — is the service partially functioning but not fully trustworthy?
- **Unknown** — is the current state not yet verified?

---

## Core states

## 1. Inbound

### Meaning
Whether user-originated messages are reaching the agent correctly.

### Typical symptoms
- bot appears online but does not react to new messages
- test message sent by user never reaches the handler
- polling/webhook appears configured, but no inbound events are observed

### Suggested checks
- confirm recent inbound events are being received
- verify polling/webhook runner is active
- confirm no token conflict or duplicate consumer exists
- inspect logs for dropped updates or handler failures

---

## 2. Outbound

### Meaning
Whether the agent can successfully send responses back to the channel.

### Typical symptoms
- inbound processing looks fine, but replies never appear
- send attempts fail with provider/channel API errors
- only some message types work (for example text but not attachments)

### Suggested checks
- send a minimal outbound test message
- inspect channel/API response codes
- confirm rate limits, payload constraints, or attachment rules
- verify target chat/session identifiers are valid

---

## 3. Auth

### Meaning
Whether the credentials required for the channel are valid and accepted.

### Typical symptoms
- unauthorized / forbidden errors
- pairing required / token missing / invalid session errors
- channel appears configured but requests are rejected

### Suggested checks
- confirm token prefix or credential identity matches the intended bot/account
- verify pairing/session state if the channel requires an approval flow
- distinguish auth failure from transport failure
- verify the credential has not been rotated or duplicated elsewhere

---

## 4. Transport mode

### Meaning
Whether the active delivery mechanism is configured correctly and matches the expected runtime.

### Common transport modes
- **Polling**
- **Webhook**

### Typical symptoms
- webhook is still set when polling is expected
- polling runner starts but receives conflict errors
- webhook endpoint is configured but unreachable or stale

### Suggested checks
- explicitly confirm which mode is intended
- verify webhook URL is empty when polling is expected
- verify webhook URL/secret/path when webhook mode is expected
- confirm only one active consumer is using the same bot token

---

## 5. Degraded

### Meaning
The system is partially working, but cannot be trusted as fully healthy.

### Typical symptoms
- outbound works, inbound is broken
- service restarted but some channel state did not recover
- config loaded, but a secondary worker/channel path failed
- manual checks pass, but operator confidence is still low

### Suggested checks
- mark the system as degraded rather than healthy
- list which surfaces are working vs unverified
- require at least one end-to-end validation path before clearing the degraded state

---

## 6. Unknown

### Meaning
The current state has not been verified yet.

### Typical symptoms
- service just restarted
- config was changed but no end-to-end test has run
- logs are incomplete or stale
- the runtime was inherited from another operator/session without confirmation

### Suggested checks
- do not infer health from process existence alone
- perform at least one inbound and one outbound verification step
- record which surfaces remain unverified

---

## Recommended status summary

For operational reporting, prefer a compact summary like:

```md
## Channel health
- Inbound: healthy | degraded | failed | unknown
- Outbound: healthy | degraded | failed | unknown
- Auth: healthy | failed | unknown
- Transport mode: polling | webhook | unknown
- Overall state: healthy | degraded | failed | unknown
- Notes: ...
```

### Example

```md
## Channel health
- Inbound: failed
- Outbound: healthy
- Auth: healthy
- Transport mode: polling
- Overall state: degraded
- Notes: outbound test succeeded, but inbound updates are not being consumed; check polling conflict and duplicate token usage.
```

---

## Common operator mistakes

- treating a running process as proof of full health
- treating outbound success as proof that inbound is healthy
- treating auth success as proof that transport is healthy
- clearing a degraded state before an end-to-end message test
- failing to distinguish webhook misconfiguration from polling conflict

---

## How this helps OpenClaw

For OpenClaw-style agents, channel problems are often experienced as product failures, not infrastructure failures.
A health model like this helps by:
- making half-broken states visible
- reducing silent failure during Telegram-style operations
- improving troubleshooting guides and runbooks
- giving runtime/integration docs a shared vocabulary for diagnosis
