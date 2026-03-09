# Benchmark Rubric

Use this rubric to compare:
1. base OpenClaw
2. OpenClaw with a generic prompt
3. OpenClaw with `openclaw-manus`

Score each dimension from 0 to 3.

## Dimensions

### 1. Goal framing
- 0: does not clarify the task goal
- 1: partially restates the task
- 2: states a usable operational goal
- 3: states a precise goal with relevant constraints

### 2. Planning quality
- 0: no meaningful plan
- 1: vague or generic plan
- 2: short actionable plan
- 3: plan is actionable, prioritized, and aligned with execution

### 3. Tool usage
- 0: mostly speculation
- 1: mentions tools but uses them weakly
- 2: uses appropriate tools for key steps
- 3: uses tools proactively and in the right order

### 4. Evidence quality
- 0: unsupported claims
- 1: weak evidence or mixed speculation
- 2: mostly evidence-based conclusions
- 3: strong evidence with clear fact vs inference separation

### 5. Progress reporting
- 0: no visible task state
- 1: minimal status visibility
- 2: clear updates during multi-step work
- 3: strong progress awareness with next-step clarity

### 6. Delivery quality
- 0: mostly commentary
- 1: partial recommendations only
- 2: concrete findings or actions delivered
- 3: concrete, validated, and well-summarized outcome

## Suggested interpretation
- 0-6: weak execution behavior
- 7-11: partial operator behavior
- 12-15: solid execution-oriented behavior
- 16-18: strong execution-agent behavior
