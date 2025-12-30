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

If `superpowers:brainstorming` skill is available, invoke it FIRST to:
- Clarify requirements with the user
- Explore technical approaches
- Identify edge cases and constraints
- Get user approval before proceeding

If the skill is not available, manually discuss with the user:
- What problem are we solving?
- What are the requirements and constraints?
- Are there edge cases to consider?
- Does the user approve proceeding with this approach?

### Step 2: Determine Folder Number

Check existing `_tasks/` directories:
```bash
ls _tasks/
```

Use the next sequential number (e.g., if `15-feature` exists, use `16`).

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

### Step 5: Commit Before Implementation

**CRITICAL**: Commit planning docs BEFORE starting implementation:

```bash
git add _tasks/{NN}-{feature-name}/
git commit -m "docs: add task and plan for {feature-name}"
```

This preserves design rationale in version control before code changes begin.

## Key Conventions

- Brainstorm/discuss requirements before planning
- Plans must include specific file paths
- Each step needs verification criteria
- Commit planning docs before coding
- Superpowers skills are optional but recommended if available

## Related Skills

- **decision-skill** - Record architectural decisions made during planning
- **changelog-skill** - Update changelog when task is complete
