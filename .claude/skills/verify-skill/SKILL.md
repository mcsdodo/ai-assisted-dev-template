---
name: verify-skill
description: Use before claiming work is complete to verify all requirements are met
---

# Verification Before Completion

This skill ensures work is truly complete before marking it done.

## When to Apply

- Before marking a task as complete
- Before creating a PR
- Before claiming "done" to the user

## Verification Checklist

### Step 1: Run Tests

If project has automated tests:

```bash
[TEST_COMMAND]
```

All tests must pass. If tests fail, fix them before proceeding.

*Skip if project has no automated tests.*

### Step 2: Check Git Status

```bash
git status
```

Verify:
- All relevant changes are committed
- No unintended files are staged
- Working directory is clean (or only has intentional uncommitted changes)

### Step 3: Verify Changelog

If project uses `CHANGELOG.md`:
- Check that `[Unreleased]` section includes an entry for this work
- If missing, run `/changelog` first

### Step 4: Review Constraints

Quickly scan project's `CLAUDE.md` for any constraints that apply to this work.

## Quick Verification Script (Example)

```bash
# Run tests, show status, preview changelog
[TEST_COMMAND] && git status && head -20 CHANGELOG.md
```

Customize `[TEST_COMMAND]` for your project (e.g., `npm test`, `pytest`, `cargo test`).

## Superpowers Integration

If `superpowers` is available, consider also invoking `superpowers:verification-before-completion` for more rigorous verification.

## Related Skills

- **changelog-skill** - Update changelog if Step 3 fails
- **release-skill** - After verification, may proceed to release
