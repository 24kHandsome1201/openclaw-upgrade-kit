# Touched Scope Reporting

This file defines a compact reporting spec for execution-oriented agents.

The goal is simple:
- make the blast radius visible
- show what changed or was inspected
- show what was intentionally not touched
- expose risk and rollback hints clearly

## When to use

Use this structure when the agent:
- edits files
- inspects or changes runtime/config state
- touches services, processes, channels, or external integrations
- performs a multi-step task where scope clarity matters

For trivial tasks, a shortened version is acceptable.

## Recommended sections

### 1. Touched files
List files that were read, edited, created, deleted, or used for validation.

Recommended format:
- `path` — action — why it mattered

Example:
- `src/app.ts` — edited — applied the minimal fix for retry handling
- `README.md` — updated — aligned docs with the new command
- `package.json` — validated — confirmed script names

If no files were touched, say so explicitly:
- `No files were touched.`

### 2. Touched systems
List non-file surfaces the agent inspected or changed.

This can include:
- services
- processes
- ports
- channels
- webhooks
- polling state
- environment/config layers
- external APIs
- deployment/runtime surfaces

Recommended format:
- system/surface — action — observed result

Example:
- `telegram gateway` — inspected — outbound healthy, inbound not confirmed
- `systemd user service` — restarted — active after reload
- `provider API` — checked — auth failure suspected from returned error type

If no systems were touched:
- `No external systems were touched.`

### 3. Untouched scope
State what the agent intentionally did not modify.

This matters because users often care as much about what stayed frozen as what changed.

Recommended format:
- untouched area — why it was left untouched

Example:
- `database schema` — not touched because the issue was isolated to gateway config
- `frontend UI` — not touched because the task only required runtime diagnosis
- `production secrets` — not touched because no credential rotation was required

### 4. Risk notes
Call out meaningful risk, uncertainty, or residual exposure.

Examples:
- runtime behavior still needs live confirmation
- restart succeeded but inbound traffic has not been revalidated
- config changed, but rollback may be required if upstream constraints differ
- only local verification was performed

Recommended format:
- risk — why it matters — whether confirmation is still needed

### 5. Rollback hints
Give the fastest safe recovery path when relevant.

This does not need to be a full rollback playbook, but it should help the operator recover.

Recommended format:
- rollback target — how to revert — prerequisite or caution

Example:
- `gateway config` — restore previous file backup and restart service — requires last known-good config
- `docs change` — revert the patch or checkout prior revision — no runtime impact
- `service restart` — return to previous unit/config state — confirm status after rollback

If rollback is not relevant, say:
- `No rollback action is needed for this step.`

## Compact output template

Use this for most non-trivial tasks:

```md
## Scope summary
- Touched files:
  - ...
- Touched systems:
  - ...
- Untouched scope:
  - ...
- Risk notes:
  - ...
- Rollback hints:
  - ...
```

## Short-form template

Use this for smaller tasks:

```md
- Touched files: ...
- Touched systems: ...
- Untouched scope: ...
- Risk notes: ...
- Rollback hints: ...
```

## Style rules

- be explicit
- prefer concrete paths/names over vague labels
- distinguish touched vs validated vs unchanged
- do not imply a system was changed if it was only inspected
- do not omit untouched high-risk areas if the user might assume they changed
- keep it short, but never ambiguous

## Success criteria

This reporting spec is working well when a user can quickly answer:
- what did the agent touch?
- what did it avoid touching?
- where is the remaining risk?
- how would I back out if needed?
