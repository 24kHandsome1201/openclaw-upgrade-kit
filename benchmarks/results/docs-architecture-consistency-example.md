# Benchmark Result Example: Docs Architecture Consistency Task

## Task
- Name: Architecture doc consistency review
- Prompt: Review this architecture document against the actual repository structure and implementation boundaries. Identify the highest-value inconsistency in component roles, request flow, or ownership claims, correct the documentation direction, and state what was validated versus what still needs runtime or cross-system confirmation.
- Task type: docs

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + `openclaw-docs`

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Skill framed the task as architecture-doc-to-implementation consistency review |
| Planning quality | 1 | 2 | 3 | Better ordering of repo inspection, module mapping, and claim-by-claim validation |
| Tool usage | 1 | 2 | 3 | Stronger verification of file layout, module boundaries, and referenced flows before editing guidance |
| Evidence quality | 1 | 2 | 3 | Better distinction between validated code-structure facts and unvalidated runtime or cross-host claims |
| Progress reporting | 0 | 1 | 2 | Clearer summary of what components, paths, and flow claims were checked |
| Delivery quality | 1 | 2 | 3 | More actionable correction direction for architecture drift and clearer boundary notes |
| **Total** | **5** | **11** | **17** | |

## Qualitative notes
- Base behavior: tends to accept high-level architecture wording or rewrite diagrams/descriptions without first checking whether the documented components and boundaries match the repository.
- Generic prompt behavior: adds better structure, but still inconsistently verifies whether the documented request flow and ownership claims are supported by actual files, configs, and module boundaries.
- Upgraded skill behavior: treats the architecture doc like an implementation-backed artifact, validates component names, paths, and code boundaries first, and clearly marks which architectural claims remain unvalidated because they depend on runtime topology or external systems.

## Conclusion
- What improved: doc-to-code component mapping, architecture drift detection, and explicit separation between validated repository structure and unvalidated runtime topology assumptions.
- What still needs work: more examples involving multi-repo boundaries, external services, and architecture diagrams tied to deployment-specific behavior.
- Recommended next benchmark: compare on an architecture overview that claims an end-to-end request path spanning local modules plus an external gateway or worker.
