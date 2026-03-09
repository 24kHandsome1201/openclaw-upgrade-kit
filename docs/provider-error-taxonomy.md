# Provider Error Taxonomy

This document defines a practical error taxonomy for model/provider failures in OpenClaw-style agent systems.

The goal is to stop different failure types from being collapsed into one vague message.
That matters because users lose trust quickly when:
- a config problem is reported as rate limiting
- an auth problem is reported as a provider outage
- a local routing bug is blamed on the upstream model

## Why this taxonomy exists

A provider-facing agent usually has several layers:
- local config
- local routing / policy / tool selection
- credentials
- upstream model/provider API
- quota / rate enforcement

If errors are not separated clearly, operators take the wrong recovery path.

---

## 1. Rate limit

### Definition
The request was rejected or delayed because the provider, model tier, or account quota/rate window was exceeded.

### Typical symptoms
- explicit 429-style responses
- quota exceeded / too many requests messaging
- temporary cooldown behavior
- requests succeed later without config changes

### Common misdiagnoses
- treating auth failure as rate limit
- treating local retry-loop exhaustion as provider rate limit
- blaming the provider when the local system is issuing duplicated requests

### Suggested next step
- inspect the raw provider status/error code if available
- check account quota/tier and request burst behavior
- reduce retry loops before blaming upstream rate policy
- record whether the error is hard quota exhaustion or temporary backoff

---

## 2. Auth failure

### Definition
The provider rejected the request because credentials, session identity, token scope, or account linkage are invalid.

### Typical symptoms
- unauthorized / forbidden responses
- invalid API key / token missing / account not allowed
- previously working requests fail immediately after credential change or rotation

### Common misdiagnoses
- confusing auth failure with config formatting issues
- assuming the provider is down because requests are uniformly rejected
- treating a workspace/account mismatch as a model-level outage

### Suggested next step
- confirm the intended provider/account is being used
- verify token presence, prefix identity, and expected environment source
- check whether the credential was rotated, revoked, or copied into the wrong runtime
- avoid printing full secrets; use prefix-only identity checks when possible

---

## 3. Config error

### Definition
The local system is misconfigured before the request is even valid for the provider.

### Typical symptoms
- missing model name
- unsupported provider/model combination
- malformed endpoint/base URL
- wrong env var names or missing config fields
- configuration passes partial validation but fails during request construction

### Common misdiagnoses
- treating bad local config as upstream provider failure
- treating malformed endpoint configuration as auth failure
- assuming the model itself is unavailable when the wrong alias is configured

### Suggested next step
- inspect the local config and normalization path first
- verify provider name, model identifier, base URL, and env variable mapping
- compare the configured path with a known-good minimal example
- separate static config validation from runtime provider validation

---

## 4. Upstream failure

### Definition
The provider or a dependency on the provider side is unavailable, unstable, or returning server-side failure.

### Typical symptoms
- 5xx errors
- provider status page incident
- intermittent failures across otherwise valid requests
- timeout or overload behavior with unchanged local config

### Common misdiagnoses
- blaming local routing when the upstream is degraded
- treating one provider/model incident as a general agent failure
- assuming retries alone will fully resolve a hard upstream outage

### Suggested next step
- check provider status / incident communication where available
- verify whether the same request fails across repeated clean attempts
- record whether the failure is global, model-specific, or region/account-specific
- degrade gracefully and surface that the issue is upstream, not user-caused

---

## 5. Local routing failure

### Definition
The local agent stack chose the wrong provider/model/path, failed to route correctly, or degraded before a valid upstream request was made.

### Typical symptoms
- one provider works elsewhere but fails only in this local runtime
- the wrong model/provider receives the request
- fallback behavior is triggered incorrectly
- tool/policy/routing logic masks the real execution path

### Common misdiagnoses
- blaming the provider when the request never reached the intended target
- calling it a config issue when the config is valid but routing policy is wrong
- calling it auth failure when the wrong credential source was selected locally

### Suggested next step
- inspect the local routing decision and selected provider/model
- verify fallback and policy layers did not rewrite the request path
- compare local runtime behavior with a known direct provider call
- expose route-choice reasoning in diagnostics where possible

---

## Recommended operator summary

When reporting provider-related failures, prefer a concise structure like:

```md
## Provider failure summary
- Classified as: rate limit | auth failure | config error | upstream failure | local routing failure
- Observed symptom: ...
- Common confusion avoided: ...
- Suggested next step: ...
```

## Classification rule of thumb

Use this order when triaging:
1. confirm local config shape
2. confirm auth identity
3. confirm local routing path
4. inspect provider response class
5. check whether quota/rate or upstream availability is the real issue

This order helps avoid the common trap of calling every failure a provider problem.
