# Task Status Index

**Generated:** YYYY-MM-DD
**Updated:** YYYY-MM-DD
**Scope:** All task folders in `_tasks/` (active + `_done/`) + `_TECH_DEBT/` items

> **Template note:** This is the central dashboard for task lifecycle tracking. The `task-plan-skill` registers new tasks here; the `move-to-done-skill` updates status and adds Change Log entries when archiving.
>
> When adapting this template, delete this note and replace the example row with real task data.

---

## Summary Statistics

| Category | Count |
|----------|-------|
| ✅ Complete & Archived | 0 |
| 🏗️ In Progress | 0 |
| 📝 Planning | 0 |
| 🔄 Superseded | 0 |
| 📖 Reference (example) | 1 |

---

## Change Log

Chronological history of status changes. Most recent first. Updated by `move-to-done-skill` when tasks are archived.

### YYYY-MM-DD
- Template created. Replace this entry with real task updates.

---

## Quick Reference Table

| Task | Claimed | Actual | Action |
|------|---------|--------|--------|
| `00-example` | Reference | 📖 Template example | None — delete when no longer needed as reference |

---

## Tech Debt Summary

| Item | Priority | Status | Action |
|------|----------|--------|--------|
| (none yet) | — | — | — |

See [`_TECH_DEBT/README.md`](_TECH_DEBT/README.md) for the full items list and [`_TECH_DEBT/CLAUDE.md`](_TECH_DEBT/CLAUDE.md) for conventions.

---

## How to Update This Index

**When a new task is planned** (`task-plan-skill` does this automatically):

1. Add a row to the Quick Reference Table with the new `{NN}-{name}` and status `📝 Planning`

**When a task's status changes** (manually or via skills):

1. Update the Claimed / Actual columns in Quick Reference Table

**When a task is archived** (`move-to-done-skill` does this automatically):

1. Update the row: `✅ Complete (moved to _done/)`
2. Add an entry to Change Log under today's date:
   ```
   ### YYYY-MM-DD
   - Task {NN} ({short-name}) complete, moved to `_done/` — one-line summary
   ```
3. Update Summary Statistics counts
