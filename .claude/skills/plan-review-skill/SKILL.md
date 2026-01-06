---
name: plan-review-skill
description: Use to review plans and designs before implementation
---

# Iterative Plan Review

Review plans for completeness, feasibility, and clarity with up to 4 iterations.

## When to Apply

- Before starting implementation
- After creating a task plan
- When reviewing design documents
- Before complex refactoring

## Requirements

Before starting:
1. **Target**: Plan or design document path
2. **Reference**: (Optional) Requirements or constraints

## Quality Gate

Exit when: **No Critical/Important issues remain**

## Review Dimensions

| Dimension | Questions |
|-----------|-----------|
| **Completeness** | All requirements addressed? Tasks identified? Edge cases considered? |
| **Feasibility** | Tasks achievable? Hidden complexities? Dependencies identified? |
| **Clarity** | Can implementer follow without ambiguity? Specific file paths? Verification steps? |
| **Scope** | YAGNI respected? No unnecessary additions? No duplication? |

## Severity Levels

| Level | Description | Action |
|-------|-------------|--------|
| **Critical** | Missing requirements, impossible tasks | Must fix before implementation |
| **Important** | Unclear steps, missing verification | Should fix before starting |
| **Minor** | Could be clearer, minor improvements | Note for consideration |

## Workflow

### Step 1: Read Target Document

Thoroughly read the plan/design document.

### Step 2: Create Progress File

Create `_plan-review.md`:

```markdown
# Plan Review Progress

**Target:** [plan document path]
**Reference:** [requirements, if any]

## Iteration 1
- [ ] Review complete
- Findings: ...
- Changes applied: ...
```

### Step 3: Iterative Review Loop (Max 4)

For each iteration:

1. **Review against dimensions**: Completeness, Feasibility, Clarity, Scope

2. **Categorize findings** by severity

3. **Fix Critical/Important issues** in the plan

4. **Update progress file**

5. **Check exit criteria**:
   - No Critical/Important issues? → Ready for implementation
   - Otherwise → Next iteration (if < 4)

### Step 4: Final Assessment

Document:
- Plan readiness for implementation
- Any caveats or assumptions
- Remaining Minor issues

## Domain Checklist

- [ ] All requirements mapped to tasks?
- [ ] Specific file paths included?
- [ ] Verification steps for each task?
- [ ] Tasks in logical order?
- [ ] No scope creep?
- [ ] Complexity appropriate?

## Example Usage

```
Target: _tasks/08-feature/02-plan.md
Reference: _tasks/08-feature/01-task.md

Iteration 1:
  Findings: [Important] Step 3 missing file paths, [Minor] Could add time estimates
  Fixed: Added specific paths to Step 3

Iteration 2:
  Findings: [Minor] Consider adding rollback section
  Assessment: Ready for implementation
```

## Related Skills

- **task-plan-skill** - Create the plans this skill reviews
- **code-review-skill** - Review implementation after coding
