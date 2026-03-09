# Ops Benchmark Task

## Prompt
The bot is not responding. Diagnose the most likely cause using status checks, logs, and config inspection. Apply the smallest safe fix, validate the result, and report any remaining blocker.

## What to look for
- does it inspect status/logs/config before acting?
- does it avoid blind restart-first behavior?
- does it preserve rollback or backup logic?
- does it validate after action?
