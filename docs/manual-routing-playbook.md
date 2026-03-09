# Manual Routing Playbook

This playbook is for runtimes where skill selection is not automatic.

The purpose is to give a repeatable operator workflow for choosing when to stay on `openclaw-manus` and when to switch to a specialized skill.

## Default rule

If the task is unclear or mixed, start with:
- `openclaw-manus`

Do not over-route too early.

## Step-by-step routing process

### Step 1: Identify the dominant task shape
Ask:
- is this mainly runtime/ops?
- is this mainly source-backed research?
- is this mainly implementation or validation-heavy coding?
- is this mainly documentation review against implementation?
- or is it still mixed?

### Step 2: Pick the starting skill
- mixed or unclear -> `openclaw-manus`
- runtime/log/config -> `openclaw-ops`
- latest-info/comparison -> `openclaw-research`
- code changes/validation -> `openclaw-coding`
- README/setup/runbook review -> `openclaw-docs`

### Step 3: Load only the needed material
For the chosen skill:
1. open `SKILL.md`
2. load only the specific reference files needed
3. avoid loading unrelated skill content

### Step 4: Re-evaluate after each meaningful stage
After a meaningful stage, ask:
- is the current skill still the dominant lane?
- has the evidence source changed?
- has the next high-value action changed?

If yes, switch.

## Common routing patterns

### Pattern A: Mixed task -> Ops -> Coding -> Docs -> Manus
Use when:
- a service issue leads to config/log inspection
- the root cause requires code changes
- the docs then need correction
- the final handoff is mixed

### Pattern B: Manus -> Research -> Docs
Use when:
- a broad request narrows into current-info verification
- the findings then require doc updates

### Pattern C: Manus -> Coding -> Manus
Use when:
- a broad repo task narrows into one concrete fix
- the task then returns to summary / handoff mode

## Concrete switching examples

### Example 1: Bot not replying
- start: `openclaw-manus`
- logs/config become dominant -> switch to `openclaw-ops`
- if fix requires code change -> switch to `openclaw-coding`
- if README/setup note is outdated -> switch to `openclaw-docs`
- final mixed summary -> switch to `openclaw-manus`

### Example 2: Compare projects and update internal note
- start: `openclaw-research`
- sources gathered and conclusion formed
- internal docs need updating -> switch to `openclaw-docs`

### Example 3: Fix one repository issue
- start: `openclaw-coding`
- inspect files and patch minimally
- validate
- if the task broadens into rollout summary -> switch to `openclaw-manus`

## Manual routing checklist

Before switching, verify:
- the next step truly belongs to a different lane
- the main evidence source has changed
- the switch will improve execution quality

Do not switch just because another skill sounds more specific.

## Fallback rule

If a switch is unclear, fall back to:
- `openclaw-manus`

It is the safest default for mixed work.

## Good manual routing behavior

Good behavior:
- start simple
- switch only when the task shape is clear
- explain the switch briefly
- switch back when the task becomes mixed again

Bad behavior:
- over-classifying too early
- staying in a specialized skill after the task has broadened
- switching without explaining why
- using multiple specialized skills at once without a clear handoff order

## Verifiable check

A manual routing flow is working when:
- the chosen skill matches the main evidence source
- specialized tasks feel more structured than under the default skill alone
- the final output still reads like one coherent execution flow
