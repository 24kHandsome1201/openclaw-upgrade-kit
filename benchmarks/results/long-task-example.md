# Benchmark Result Example: Long Task / Resume Flow

## Task
- Name: Interrupted repository fix with checkpoint and resume
- Prompt: Review a repository, identify one obvious issue, apply a minimal fix, record a checkpoint when interrupted before validation, then resume and complete the task without redoing the full discovery process.
- Task type: long-task

## Compared runs
1. base OpenClaw
2. OpenClaw + generic prompt
3. OpenClaw + upgraded long-task pattern set

## Scores

| Dimension | Base | Generic Prompt | Upgraded Skill/Pattern | Notes |
|---|---:|---:|---:|---|
| Goal framing | 1 | 2 | 3 | Long-task flow makes stage goal explicit |
| Planning quality | 1 | 2 | 3 | Better stage model and checkpoint timing |
| Tool usage | 1 | 2 | 3 | Resume step rechecks state before proceeding |
| Evidence quality | 1 | 2 | 3 | Clearer distinction between patched state and validated state |
| Progress reporting | 0 | 1 | 3 | Checkpoint and recovery updates expose task state much better |
| Delivery quality | 1 | 2 | 3 | Ends with resumed completion instead of partial commentary |
| **Total** | **5** | **11** | **18** | |

## Qualitative notes
- Base behavior: often loses continuity after interruption or restarts discovery from scratch.
- Generic prompt behavior: may preserve some structure, but checkpoint quality and resume discipline are inconsistent.
- Upgraded skill/pattern behavior: records stage state explicitly, resumes from the right point, and validates before claiming completion.

## Conclusion
- What improved: task continuity, checkpoint usefulness, resume discipline, and visibility into validated vs pending work.
- What still needs work: more examples involving runtime drift, environment changes, or multi-host interruptions.
- Recommended next benchmark: compare a service incident interrupted before restart validation and resumed later.
