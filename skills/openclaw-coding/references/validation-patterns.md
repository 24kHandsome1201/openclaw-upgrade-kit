# Validation Patterns

Validation after coding changes may include:
- targeted test run
- build or lint command
- focused runtime check
- file-level verification
- output comparison

If full validation is not possible, state what was validated and what remains unconfirmed.

## Rollback path

When a coding task changes behavior, config, or project structure, include a short rollback path.

Preferred shape:
- rollback target
- how to revert it
- what to re-run after rollback

Examples:
- `src/auth.ts` — revert the patch or restore the previous commit, then rerun the targeted auth test
- `package.json` — restore the prior script/dependency block, then rerun install/build
- `docs + code` change — revert both together if the implementation is rolled back, then recheck doc/code consistency

If no rollback action is needed, say so explicitly:
- `No rollback action is needed for this step.`
