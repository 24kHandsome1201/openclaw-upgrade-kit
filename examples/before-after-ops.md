# Before / After: Ops Task

## Task
"The bot is not replying in Telegram. Diagnose it and fix the obvious issue."

## Before (base OpenClaw tendency)
- may speculate about likely causes
- may suggest checking logs/config without actually doing it
- may recommend restarting too early
- may not preserve rollback or validate afterward

## After (`openclaw-manus`)
- checks service status first
- reads logs before inferring root cause
- inspects config and identifies likely policy errors
- applies the smallest safe fix after backup
- validates config syntax and service state after restart
- includes a rollback hint to return to the last known-good config or service state
- distinguishes confirmed facts from remaining hypotheses

## Behavioral difference
The upgraded behavior is evidence-first, lower-risk, and more operator-like.
