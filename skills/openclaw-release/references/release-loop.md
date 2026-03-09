# Release Loop

Use this loop for release-oriented work:
1. define the intended release scope
2. inspect current repo state and release docs
3. run the most relevant release checks
4. compare release claims against actual repository contents
5. record risks, blockers, and dry-run results
6. decide: ready / pass with risks / not ready
7. summarize next action

For non-trivial releases, prefer including:
- release checklist review
- packaging helper checks
- version info capture
- dry-run report

For release work that changes packaging, install flow, docs, or verification assets, also include:
- rollback path for the release-ready state
- what tag/doc/script state would be restored
- what verification should be rerun after rollback

Preferred release rollback summary:
- release artifact or doc affected
- how to revert to the last known-good release state
- what smoke/dry-run checks to rerun
