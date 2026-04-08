---
name: move-to-done-skill
description: Use when a task folder or tech-debt item is completed and needs to be verified and archived to _done/ with index updates
---

# Move to Done Skill

Verify completion, then archive work items and update indexes. This skill adds the archival lifecycle stage that's easy to forget — so active task folders don't accumulate "done but not archived" drift.

## Step 0: Verify Before Moving

**Always verify the work is actually done before archiving.**

1. **Read the task/tech-debt file** — identify acceptance criteria, planned deliverables, or described fix
2. **Cross-check against code** — search for commits, changed files, or features mentioned
3. **Ask the user**: "Want me to verify the implementation in code, or just archive based on docs?"

If the user says **verify**, check that:

- Claimed code changes exist (`git log --oneline --all --grep="task NN"` or search for key files)
- Tests pass if tests were part of the deliverable
- No partial implementation left behind (e.g., plan lists 5 steps, only 3 committed)
- Documentation was updated per the plan

If anything is incomplete, **report findings instead of moving to done**.

## Distinguish: Task vs Tech Debt

| Signal | It's a **Task** | It's a **Tech Debt** item |
|--------|-----------------|---------------------------|
| Path | `_tasks/{NN}-{name}/` (folder) | `_tasks/_TECH_DEBT/{NN}-{name}.md` (single file) |
| Content | Implementation plans, designs, task description | Problem description, root cause, recommended fix |
| `Status:` header field | Sometimes | Always |
| Lifecycle | Plan → Implement → Archive | Discovered → Planned → Fixed → Archived |

## Task → `_done/`

```bash
# 1. Move the folder
mv _tasks/{NN}-{name} _tasks/_done/{NN}-{name}

# 2. Update _tasks/TASK-STATUS-INDEX.md
#    a. Update/add row in Quick Reference Table:
#       | {NN}-{name} | Complete | ✅ Complete (moved to `_done/`) | None |
#    b. Add entry to Change Log section (top of list, under today's date):
#       ### YYYY-MM-DD
#       - Task NN ({short-name}) complete, moved to `_done/` — one-line summary

# 3. Commit
git add _tasks/_done/{NN}-{name}/ _tasks/TASK-STATUS-INDEX.md
git commit -m "docs: move task {NN} ({short-name}) to _done"
```

## Tech Debt → `_done/`

```bash
# 1. Move the file
mv _tasks/_TECH_DEBT/{NN}-{name}.md _tasks/_TECH_DEBT/_done/{NN}-{name}.md

# 2. Update the Status field in the moved file header:
#    **Status:** Fixed

# 3. Add a Decision Log entry in the moved file:
#    | YYYY-MM-DD | Fixed | Brief description of fix or PR reference |

# 4. Update _tasks/_TECH_DEBT/README.md
#    a. Remove the row from the "Items" table
#    b. Add a row to the "Completed Items (in _done/)" table

# 5. Commit
git add _tasks/_TECH_DEBT/ _tasks/_TECH_DEBT/_done/
git commit -m "docs: mark tech debt {NN} ({short-name}) as fixed"
```

## Why Archive Instead of Delete

- **Historical context**: Plans and decisions stay discoverable for future work
- **Numbering collision safety**: `_done/` items retain their NN, so `task-plan-skill` must Glob both `_tasks/` and `_tasks/_done/` when finding the next number
- **Audit trail**: The Change Log in `TASK-STATUS-INDEX.md` provides a human-readable timeline
- **Undo safety**: Archive is reversible (just `mv` back); delete isn't

## Common Mistakes

- **Moving without verifying** — the task doc says "complete" but code tells a different story
- **Forgetting to `git add` the delete side of the move** — `mv` creates a delete + add, both need staging
- **Updating only the file but not `TASK-STATUS-INDEX.md`** — the index drifts out of sync with reality
- **Not adding a Change Log entry** — the index loses its human-readable timeline
- **Archiving tech debt without updating `_TECH_DEBT/README.md`** — the items table still shows it as open

## Integration With Other Skills

- **task-plan-skill** — Creates new task folders; registers them in `TASK-STATUS-INDEX.md`
- **verify-skill** — Should be run before `move-to-done` to confirm work is actually complete
- **changelog-skill** — Separate from archival; changelog tracks user-visible changes, archival tracks workflow lifecycle

## Related

- [`_tasks/CLAUDE.md`](../../../_tasks/CLAUDE.md) — Task folder conventions
- [`_tasks/_TECH_DEBT/CLAUDE.md`](../../../_tasks/_TECH_DEBT/CLAUDE.md) — Tech debt conventions
- [`_tasks/TASK-STATUS-INDEX.md`](../../../_tasks/TASK-STATUS-INDEX.md) — Central task dashboard
