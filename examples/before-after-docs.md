# Before / After: Docs Task

## Task
"Review this README and make sure it matches the real setup flow."

## Before (base OpenClaw tendency)
- may rewrite documentation stylistically without checking code
- may preserve outdated setup steps
- may identify possible drift but stop before correcting it
- may not verify that documented commands actually exist

## After (`openclaw-manus`)
- inspects the README and the actual setup scripts/config first
- compares docs to implementation instead of guessing
- patches only the drifted sections
- verifies that referenced commands and files exist
- summarizes what is now aligned and what still needs runtime confirmation

## Behavioral difference
The upgraded behavior treats documentation as an operational artifact that must match reality.
