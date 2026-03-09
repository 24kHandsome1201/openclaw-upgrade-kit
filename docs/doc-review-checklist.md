# Doc Review Checklist

Use this checklist when reviewing README files, setup docs, runbooks, or release notes against the actual repository state.

## 1. Scope
- what document is being reviewed?
- what implementation files/scripts/configs does it describe?
- is runtime validation possible in this pass?

## 2. Command accuracy
- do referenced commands exist?
- are script names correct?
- is the package manager correct?
- do setup/run/test/build commands match current files?

## 3. Path and file accuracy
- do referenced files and directories exist?
- do documented config paths match actual paths?
- do filenames and service names match current repo state?

## 4. Setup prerequisites
- are required env/config prerequisites documented?
- are secrets or external account dependencies called out?
- is any required toolchain or runtime missing from docs?

## 5. Feature / status claims
- do docs claim features that are not reflected in code/config?
- do status labels like MVP / implemented / planned match reality?
- are release/version notes consistent with current repository contents?

## 6. Validation boundaries
- what was validated against code/files/scripts?
- what was not runtime-tested?
- what still requires environment-level confirmation?

## 7. Highest-value fixes first
Prioritize:
1. broken setup instructions
2. incorrect paths / commands
3. misleading implementation claims
4. missing prerequisites
5. lower-priority clarity issues

## 8. Output expectations
A good docs review should leave behind:
- a clear list of factual drift
- corrected high-value doc sections or explicit correction direction
- a distinction between verified facts and remaining unknowns
- a concise next-step list if more runtime validation is needed
