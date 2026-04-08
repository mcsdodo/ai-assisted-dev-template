---
name: move-to-done-skill
description: Use when a task folder or tech-debt item is completed and needs to be verified and archived to _done/ with index updates
---

# Move to Done

Verify completion, then archive work items and update indexes. Adds the archival lifecycle stage that's easy to forget — so active task folders don't accumulate "done but not archived" drift.

## Step 0: Verify Before Moving

**Always verify the work is actually done before archiving.**

1. Read the task/tech-debt file — identify acceptance criteria, planned deliverables, or described fix
2. Cross-check against code — search for commits, changed files, or features mentioned
3. Ask the user: "Want me to verify the implementation in code, or just archive based on docs?"

If the user says **verify**, check that:

- Claimed code changes exist (`git log --oneline --all --grep="task NN"`)
- Tests pass if tests were part of the deliverable
- No partial implementation left behind (e.g., plan lists 5 steps, only 3 committed)
- Documentation was updated per the plan

If anything is incomplete, **report findings instead of moving to done**.

## Task vs Tech Debt

| Signal | Task | Tech Debt |
|---|---|---|
| Path | `_tasks/{NN}-{name}/` (folder) | `_tasks/_TECH_DEBT/{NN}-{name}.md` (file) |
| Lifecycle | Plan → Implement → Archive | Discovered → Planned → Fixed → Archived |

## Task → `_done/`

```bash
# 1. Move the folder
mv _tasks/{NN}-{name} _tasks/_done/{NN}-{name}

# 2. Update _tasks/TASK-STATUS-INDEX.md
#    - Quick Reference Table row: ✅ Complete (moved to `_done/`)
#    - Change Log entry under today's date: one-line summary

# 3. Commit
git add _tasks/_done/{NN}-{name}/ _tasks/TASK-STATUS-INDEX.md
git commit -m "docs: move task {NN} ({short-name}) to _done"
```

## Tech Debt → `_done/`

```bash
# 1. Move the file
mv _tasks/_TECH_DEBT/{NN}-{name}.md _tasks/_TECH_DEBT/_done/{NN}-{name}.md

# 2. Update the moved file: set Status to "Fixed", add Decision Log entry
#    | YYYY-MM-DD | Fixed | PR reference or fix summary |

# 3. Update _tasks/_TECH_DEBT/README.md
#    - Remove row from "Items" table
#    - Add row to "Completed Items (in _done/)" table

# 4. Commit
git add _tasks/_TECH_DEBT/ _tasks/_TECH_DEBT/_done/
git commit -m "docs: mark tech debt {NN} ({short-name}) as fixed"
```

## Common Mistakes

- **Moving without verifying** — the task doc says "complete" but code tells a different story
- **Forgetting to `git add` the delete side of `mv`** — a move is a delete + add, both need staging
- **Drifting index** — updating the file but not `TASK-STATUS-INDEX.md`
- **Archiving tech debt without updating `_TECH_DEBT/README.md`** — the items table still shows it as open
- **Deleting instead of archiving** — `_done/` retains the NN, which `task-plan-skill` needs for collision-free numbering
