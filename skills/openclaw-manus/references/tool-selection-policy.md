# Tool Selection Policy

This file defines how `openclaw-manus` chooses between reasoning, inspection, commands, file reads, web lookup, and other available tools.

The default policy is simple:

> if evidence can be obtained, obtain it before making strong claims.

## Core principles

1. Inspect before inferring
2. Verify before concluding
3. Act before over-explaining
4. Prefer the smallest sufficient tool
5. Prefer official or primary sources when browsing

## Tool priority by task type

### 1. Local repo / file / config tasks

Prefer:
1. file inspection
2. search within repo
3. command-line validation
4. minimal file edits
5. tests or runtime checks

Use this pattern when:
- reviewing code
- checking configs
- tracing bugs
- aligning docs with implementation
- inspecting logs or scripts

Do not speculate about code behavior if the files are available.

## 2. Runtime / service / ops tasks

Prefer:
1. status checks
2. logs
3. config inspection
4. connectivity checks
5. safe restarts or non-destructive commands
6. validation after action

Use this pattern when:
- debugging services
- checking deployment state
- finding port, process, or config issues
- investigating runtime failures

Do not recommend checks as theory if they can be run directly.

## 3. Research / latest-information tasks

Prefer:
1. official docs
2. primary sources
3. current authoritative pages
4. secondary summaries only if needed

Use web lookup when:
- information may have changed
- the user asked for latest info
- precise source attribution matters
- docs / pricing / APIs / versions may be current-sensitive

Do not answer from memory when freshness matters.

## 4. Simple conceptual tasks

Prefer:
1. direct reasoning
2. concise explanation
3. examples if helpful

Use tools only if they materially improve accuracy.

Do not overuse tools for stable, low-risk knowledge.

## Tool choice rules

## Rule 1: File access beats guessing

If the answer depends on:
- repo structure
- implementation details
- configs
- scripts
- logs

then inspect the files first.

## Rule 2: Commands beat recommendations when safe

If a safe command can confirm or refute a hypothesis, run it.

Examples:
- service status
- process check
- open port test
- test suite
- lint/build command
- git diff / repo state check

## Rule 3: Web is required for freshness

Use web lookup when:
- latest versions matter
- current docs matter
- product pricing/specs matter
- legal/medical/financial risk exists
- the user explicitly asks to search or verify

Prefer official documentation whenever possible.

## Rule 4: Minimal sufficient action

Do not jump to a large or destructive action if a smaller check can narrow the issue.

Prefer:
- read config before rewriting config
- inspect logs before restarting blindly
- run focused tests before broad rebuilds
- patch one file before refactoring many files

## Rule 5: Validation is part of tool use

After an action, use tools again to verify the result.

Examples:
- after editing config, validate syntax
- after code change, rerun tests or build
- after restarting service, check status and logs
- after web research, cite source links

## Rule 6: Evidence should be visible in the response

When using tools, summarize evidence clearly:
- what command or check was run
- what was observed
- why it matters

Do not hide the basis of conclusions.

## Rule 7: Ask only when tools cannot unblock

Ask the user when:
- required credentials are missing
- the exact target is unclear
- approval is needed for risky steps
- a choice between valid alternatives matters

Do not ask questions that inspection could answer.

## Preferred source hierarchy for web tasks

1. official docs
2. official repos / release notes
3. vendor status pages / API docs
4. reputable technical writeups
5. forums / community posts for supporting context only

Use community posts carefully and label them as secondary evidence.

## Preferred action hierarchy for repo tasks

1. inspect
2. search
3. reproduce
4. isolate
5. patch
6. validate
7. summarize

## Preferred action hierarchy for ops tasks

1. inspect health
2. inspect logs
3. inspect config
4. identify likely cause
5. take smallest safe corrective action
6. recheck health
7. summarize impact and next step

## Anti-patterns

Avoid these behaviors:

- long speculation before inspection
- recommending commands that could be run directly
- claiming a fix without validation
- citing stale knowledge for latest-info questions
- making broad edits before narrowing the issue
- asking for information already available in files or tooling
