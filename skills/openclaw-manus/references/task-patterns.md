# Task Patterns

This file defines recommended execution patterns for the main task categories supported by `openclaw-manus`.

These patterns help the agent choose an effective workflow quickly without improvising from scratch every time.

## Overview

The core task modes are:

1. Research
2. Coding
3. Ops
4. Docs

Each mode follows the same high-level philosophy:
- frame the goal
- inspect evidence
- plan briefly
- execute the next useful step
- validate where possible
- report clearly

The difference is in what to inspect first, how to act, and what counts as successful delivery.

---

## 1. Research mode

Use this mode when the user asks to:
- compare tools, products, libraries, or frameworks
- find latest information
- verify a claim
- summarize official guidance
- assess whether an idea is valuable or differentiated
- collect evidence across sources

### Default workflow

1. Clarify the exact research question
2. Determine whether freshness matters
3. Find primary / official sources first
4. Extract relevant facts
5. Compare sources
6. Identify conclusions and uncertainties
7. Report findings with source links

### Priorities

- prioritize official documentation
- distinguish facts from inferences
- use current sources when the topic may have changed
- cite sources clearly
- avoid over-quoting

### Deliverables

Typical outputs:
- comparison table
- recommendation with tradeoffs
- source-backed summary
- list of opportunities / risks
- research brief

### Anti-patterns

Avoid:
- answering latest-info questions from memory
- relying only on secondary summaries
- making product recommendations without current evidence
- turning research into generic brainstorming

---

## 2. Coding mode

Use this mode when the user asks to:
- fix a bug
- update code
- refactor a module
- add a feature
- align docs with code
- inspect implementation details
- validate build/test behavior

### Default workflow

1. Identify the requested behavior or issue
2. Inspect the relevant files
3. Reproduce or narrow the issue if needed
4. Create a small action plan
5. Apply the smallest useful change
6. Validate with tests, builds, or targeted checks
7. Summarize what changed and any remaining risks

### Priorities

- inspect before editing
- minimize unrelated changes
- preserve surrounding behavior
- validate after modification
- make diffs easy to review

### Deliverables

Typical outputs:
- patch / code change
- root-cause summary
- validation result
- remaining edge cases
- recommended next cleanup step

### Anti-patterns

Avoid:
- making broad refactors before isolating the issue
- changing many files without justification
- claiming a fix without running validation
- describing what should be changed without actually changing it when changes are possible

---

## 3. Ops mode

Use this mode when the user asks to:
- diagnose a service issue
- inspect logs
- fix config problems
- check ports/processes/status
- validate deployment/runtime state
- troubleshoot infra-related failures

### Default workflow

1. Identify the target service / host / environment
2. Check service health or runtime status
3. Inspect relevant logs
4. Inspect configuration
5. Narrow the likely cause
6. Take the smallest safe corrective action
7. Recheck health and summarize outcome

### Priorities

- inspect state before restarting blindly
- prefer reversible actions
- validate after changes
- note risk when touching live systems
- keep rollback in mind

### Deliverables

Typical outputs:
- root-cause hypothesis with evidence
- corrected config
- service/action summary
- validation result
- rollback or next-step guidance

### Anti-patterns

Avoid:
- restarting services as a first reflex
- rewriting config before reading current config
- making production claims without runtime evidence
- hiding blockers like missing permissions or unreachable hosts

---

## 4. Docs mode

Use this mode when the user asks to:
- review docs
- align docs with code
- improve setup instructions
- identify missing operational details
- clean up README / architecture / handoff docs

### Default workflow

1. Identify the documentation target
2. Inspect related code / config / scripts if relevant
3. Compare the docs to the actual implementation
4. note inaccuracies, gaps, or drift
5. update the docs or produce actionable findings
6. summarize what changed or what still needs confirmation

### Priorities

- doc-to-code consistency
- setup correctness
- command accuracy
- environment variable clarity
- operational completeness

### Deliverables

Typical outputs:
- corrected documentation
- drift report
- setup clarification
- missing prerequisites list
- rollout / handoff notes

### Anti-patterns

Avoid:
- editing docs without checking code
- preserving outdated commands for convenience
- writing vague documentation without operational steps
- assuming environment details not present in the repo

---

## Cross-mode guidance

Some tasks span multiple modes.

### Research + Coding
Example:
- evaluate a library, then integrate it

Suggested approach:
1. research official guidance
2. inspect current codebase fit
3. make minimal change
4. validate

### Coding + Ops
Example:
- patch config-related code, then validate service behavior

Suggested approach:
1. inspect code and config
2. patch minimally
3. restart/reload only if needed
4. validate runtime

### Docs + Coding
Example:
- fix implementation and then update docs

Suggested approach:
1. inspect actual implementation
2. apply code fix
3. update docs to match
4. summarize both

### Research + Docs
Example:
- verify latest official docs and update internal instructions

Suggested approach:
1. browse official source
2. compare internal doc
3. update drifted sections
4. cite source links

---

## Choosing a mode quickly

Use these heuristics:

- If current information may have changed -> Research
- If files or code must change -> Coding
- If runtime state / service health matters -> Ops
- If the artifact is documentation -> Docs

When unsure:
- choose the mode that matches the first required evidence source

---

## Escalation rule

If a task starts in one mode but evidence reveals another mode is needed, switch explicitly.

Examples:
- a Docs task reveals implementation drift -> move into Coding + Docs
- a Coding task reveals runtime misconfiguration -> move into Ops
- an Ops task requires checking latest vendor docs -> add Research

State the mode shift briefly so the user can follow the reasoning.

---

## Success criteria by mode

### Research success
- conclusions are source-backed
- freshness is handled correctly
- uncertainty is clearly stated

### Coding success
- changes are minimal and relevant
- result is validated
- summary is specific

### Ops success
- issue is inspected systematically
- action is safe and evidence-driven
- post-action state is checked

### Docs success
- documentation reflects actual implementation
- instructions are actionable
- drift is reduced or clearly identified
