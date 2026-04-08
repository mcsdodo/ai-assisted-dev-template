---
name: task-plan-skill
description: Use when planning features that span multiple files or require design-first thinking
---

# Task Planning Skill

This skill guides the creation of structured task folders for complex features.

## When to Apply

- Features spanning multiple files
- Multi-session work
- Complex changes requiring systematic planning
- Architectural changes

## Workflow

### Step 1: Brainstorm (Recommended)

If `superpowers:brainstorming` is available, invoke it FIRST to clarify requirements, explore approaches, surface edge cases, and get user approval. If not available, cover the same ground in a manual discussion before proceeding.

### Step 2: Determine Folder Number

**CRITICAL — check BOTH `_tasks/` and `_tasks/_done/`** (archived tasks retain their numbers, so next number must not collide):

```
Glob(pattern: "[0-9][0-9]-*", path: "_tasks")
Glob(pattern: "[0-9][0-9]-*", path: "_tasks/_done")
```

Extract the highest folder number from BOTH results, add 1, zero-pad to 2 digits. Do NOT use `ls _tasks/` alone — it misses `_done/` and can cause NN collisions.

### Step 3: Create Task File

Create `_tasks/{NN}-{feature-name}/01-task.md`:

```markdown
**Date:** YYYY-MM-DD
**Subject:** [Feature description]
**Status:** Planning

## Goal

[What this feature accomplishes - from brainstorming]

## Requirements

- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

## Technical Considerations

- [Technical note from brainstorming]
- [Constraint or dependency]
- [Edge case to handle]

## Out of Scope

- [Explicitly excluded items]
```

### Step 4: Create Plan File

If available, use `superpowers:writing-plans` skill to develop the plan. Create `_tasks/{NN}-{feature-name}/02-plan.md`:

```markdown
**Date:** YYYY-MM-DD
**Subject:** Implementation plan for [feature]
**Status:** Planning

## Implementation Steps

### Step 1: [Component/Phase name]

**Files:**
- `path/to/file.ext` - [what changes]

**Changes:**
- [Specific change 1]
- [Specific change 2]

**Verification:**
- [How to verify this step works]

### Step 2: [Next component]
...

## Verification Checklist

- [ ] [Overall acceptance criterion 1]
- [ ] [Overall acceptance criterion 2]
- [ ] Tests pass
- [ ] Documentation updated
```

### Step 5: Register Task in TASK-STATUS-INDEX.md

Add a row to the Quick Reference Table in [`_tasks/TASK-STATUS-INDEX.md`](../../../_tasks/TASK-STATUS-INDEX.md):

```markdown
| `{NN}-{feature-name}` | Planning | 📝 Planning | None |
```

Also increment the `📝 Planning` count in the Summary Statistics table.

This keeps the central dashboard in sync with actual task state. The `move-to-done-skill` will update this row again when the task is archived.

### Step 6: Commit Before Implementation

**CRITICAL**: Commit planning docs BEFORE starting implementation:

```bash
git add _tasks/{NN}-{feature-name}/ _tasks/TASK-STATUS-INDEX.md
git commit -m "docs: add task and plan for {feature-name}"
```

This preserves design rationale in version control before code changes begin.

## Related Skills

- **decision-skill** — Record architectural decisions made during planning
- **move-to-done-skill** — Verify and archive the task when complete
- **changelog-skill** — Update changelog when task is complete
