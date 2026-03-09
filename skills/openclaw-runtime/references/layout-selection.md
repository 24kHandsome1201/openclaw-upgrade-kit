# Layout Selection

Choose a runtime layout based on who is using the skills and how versioned the installation should be.

## Prefer a user-level local skills directory when
- one developer is experimenting locally
- fast setup matters most

## Prefer a repo-local mirror when
- the skills should stay scoped to one project
- you want to avoid touching a global skills directory

## Prefer a shared versioned skills directory when
- a team needs consistent local installs
- installation should be tied to a known tag

## Prefer a release-archive workflow when
- you are validating a release candidate
- you want to inspect a packaged ref before distribution

## Verification rule
For any layout, verify:
- the expected skills were installed
- each installed skill contains `SKILL.md`, `references/`, and `agents/openai.yaml`
- the runtime or workflow can point to the chosen skill path
