---
name: code-review-skill
description: Use to review code implementations with iterative quality gates
---

# Iterative Code Review

Review code for quality, correctness, and best practices with up to 4 iterations.

## When to Apply

- After implementing a feature
- Before creating a PR
- After significant refactoring
- When code quality is uncertain

## Requirements

Before starting:
1. **Target**: File path or git range to review
2. **Reference**: Plan, spec, or requirements document

## Quality Gate

Exit when: **Tests pass + no Critical/Important issues**

## Severity Levels

| Level | Description | Action |
|-------|-------------|--------|
| **Critical** | Bugs, security issues, broken functionality | Must fix before proceeding |
| **Important** | Missing error handling, spec misalignment | Should fix before merge |
| **Minor** | Style, naming, small improvements | Note for later |

## Workflow

### Step 1: Gather Context

```bash
# If reviewing git range
git diff [BASE_SHA]..[HEAD_SHA] --stat
git log [BASE_SHA]..[HEAD_SHA] --oneline

# Read reference document
```

### Step 2: Run Tests (Baseline)

```bash
[TEST_COMMAND]
```

Tests must pass before review begins.

### Step 3: Create Progress File

Create `_code-review.md` to track iterations:

```markdown
# Code Review Progress

**Target:** [file or git range]
**Reference:** [plan/spec document]

## Iteration 1
- [ ] Review complete
- Findings: ...
- Changes applied: ...
```

### Step 4: Iterative Review Loop (Max 4)

For each iteration:

1. **Dispatch reviewer**: Use `superpowers:code-reviewer` agent with:
   - What was implemented
   - Reference document
   - Code target (files or git range)

2. **Categorize findings** by severity

3. **Fix Critical/Important issues**

4. **Re-run tests**: `[TEST_COMMAND]`

5. **Update progress file**

6. **Check exit criteria**:
   - Tests pass AND no Critical/Important issues? → Done
   - Otherwise → Next iteration (if < 4)

### Step 5: Final Assessment

Document in progress file:
- Summary of changes made
- Remaining Minor issues (if any)
- Readiness for merge

## Domain Checklist

- [ ] Tests pass?
- [ ] No obvious bugs?
- [ ] Error handling adequate?
- [ ] Security considerations addressed?
- [ ] Matches specification/requirements?
- [ ] No scope creep beyond requirements?
- [ ] Follows project patterns (see CLAUDE.md)?

## Example Usage

```
Target: src/auth/login.ts
Reference: _tasks/05-auth-feature/02-plan.md

Iteration 1:
  Findings: [Critical] Missing input validation, [Minor] Inconsistent naming
  Fixed: Added validation
  Tests: Pass

Iteration 2:
  Findings: [Minor] Could add more specific error messages
  Assessment: Ready for merge (only Minor issues remain)
```

## Related Skills

- **plan-review-skill** - Review plans before implementation
- **test-review-skill** - Review test coverage
- **verify-skill** - Quick verification checklist
