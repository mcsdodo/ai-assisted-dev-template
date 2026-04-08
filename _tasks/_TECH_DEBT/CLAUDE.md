# Tech Debt Documentation Guidelines

This folder tracks technical debt items discovered during development.

## File Structure

Each tech debt item gets its own numbered markdown file:

```
_tasks/_TECH_DEBT/
├── CLAUDE.md                              # This file
├── README.md                              # Index with summary table
├── {NN}-{descriptive-name}.md             # Active tech debt items (numbered)
└── _done/                                 # Archived fixed items (retain original NN)
    └── {NN}-{descriptive-name}.md
```

## File Naming

Use sequential numbering like `_tasks/`:
- `01-first-issue.md`
- `02-second-issue.md`
- `03-third-issue.md`

**CRITICAL — check BOTH locations when finding the next number** (items move to `_done/` but retain their numbers):

```
Glob(pattern: "[0-9][0-9]-*.md", path: "_tasks/_TECH_DEBT")
Glob(pattern: "[0-9][0-9]-*.md", path: "_tasks/_TECH_DEBT/_done")
```

Extract the highest file number from BOTH results, add 1, zero-pad to 2 digits.

## File Template

```markdown
# Tech Debt: {Title}

**Date:** YYYY-MM-DD
**Priority:** Critical | High | Medium | Low
**Effort:** Low (<2h) | Medium (2-8h) | High (1-3d) | Very High (>3d)
**Component:** `path/to/affected/file`
**Status:** Open | In Progress | Fixed | Wont Fix

## Problem

Clear description of the technical debt.

## Impact

- What breaks or degrades because of this?
- What's the maintenance burden?
- What's blocked by this?

## Root Cause

Why does this debt exist? (Historical, time pressure, scope creep, etc.)

## Recommended Solution

The proposed fix with:
- Implementation steps
- Code examples if helpful
- Files affected

## Alternative Options (if any)

Other approaches considered and why they're not recommended.

## Related

- Links to related files, PRs, or other tech debt items

## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| YYYY-MM-DD | Initial analysis | Why the item was created |
```

## Priority Guidelines

| Priority | Definition |
|----------|------------|
| **Critical** | Blocks development or causes production issues |
| **High** | Significant maintenance burden or risk |
| **Medium** | Noticeable friction but manageable |
| **Low** | Nice to fix when convenient |

## Effort Guidelines

| Effort | Definition |
|--------|------------|
| **Low** | < 2 hours |
| **Medium** | 2-8 hours |
| **High** | 1-3 days |
| **Very High** | > 3 days |

## When to Create Tech Debt Items

- During code review when you spot issues outside PR scope
- After hotfixes that need proper cleanup
- When discovering architectural inconsistencies
- When implementing workarounds for deeper problems

## Lifecycle

1. **Discovery**: Create file, add to README table
2. **Planning**: Create task in `_tasks/{NN}-{name}/` when ready to fix
3. **Resolution**: Update Status to "Fixed", link to PR
4. **Archive**: Invoke `move-to-done-skill` to verify the fix and move the file to `_tasks/_TECH_DEBT/_done/`. The skill also updates `README.md` (moves row from "Items" to "Completed Items") and the file's Decision Log.

See [`.claude/skills/move-to-done-skill/SKILL.md`](../../.claude/skills/move-to-done-skill/SKILL.md) for the archival process.

## Decision Log Guidelines

Every tech debt item should include a **Decision Log** table at the bottom to track the chronological history of decisions and changes.

### When to Add Entries

Add a new row to the Decision Log when:
- Creating the initial tech debt item
- Changing the recommended solution approach
- Updating priority or status
- Completing implementation
- Deciding to defer or close as "Won't Fix"

### Entry Format

| Column | Content |
|--------|---------|
| **Date** | YYYY-MM-DD format |
| **Decision** | Brief description (e.g., "Created analysis", "Changed to Option B", "Fixed in PR #123") |
| **Rationale** | Why this decision was made |

### Example

```markdown
## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2025-01-15 | Created analysis | Discovered during feature work that component X needs refactoring |
| 2025-01-20 | Recommend Option A | Full rewrite is cleaner than incremental fixes |
| 2025-02-01 | Implemented fix | PR #123 merged, component refactored |
```

This provides an audit trail showing how the tech debt evolved from discovery to resolution.
