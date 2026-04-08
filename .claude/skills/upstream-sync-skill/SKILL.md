---
name: upstream-sync-skill
description: Use when asked to learn from an upstream or descendant project and sync its refinements back into this template
---

# Upstream Sync

End-to-end workflow: explore a descendant project, write a sync analysis to `_template/sync/`, commit it, apply the updates, commit those. Produces two separate commits.

## Workflow

**1. Get upstream path.** Ask the user. Verify it's a git repo with a root `CLAUDE.md`. Stop if neither is present.

**2. Explore upstream.** Read these locations and classify each pattern found:

- `CLAUDE.md` — structure, rules, new sections
- `.claude/settings.json`, `.claude/hooks/`, `.claude/rules/` — automation & scoping
- `.claude/skills/`, `.claude/commands/` — workflows
- `_tasks/CLAUDE.md`, `_tasks/_TECH_DEBT/CLAUDE.md`, `_tasks/TASK-STATUS-INDEX.md` — task conventions
- Root `CHANGELOG.md`, `DECISIONS.md` — format differences

| Classification | Action |
|---|---|
| Refinement of an existing template pattern | Consider adopting |
| Net-new generic pattern | Adopt (abstracted) |
| Domain-specific (DB, framework, API, service names) | Skip |
| Template already more mature | Keep template as-is |

**3. Brainstorm scope (optional).** Ask whether to invoke `superpowers:brainstorming` for scope/aggressiveness decisions. **If used: STOP after brainstorming — do NOT invoke `writing-plans` or any superpowers continuation.** The sync doc is not a formal design doc.

**4. Write the sync doc.** File: `_template/sync/YYYY-MM-DD-upstream-sync.md` (always this literal suffix, never project-specific).

Content rules — STRICT:

| Include | Exclude |
|---|---|
| Generic references ("upstream uses X") | File paths from upstream |
| Pattern descriptions and principles | Service/database/framework names |
| Template-vs-upstream gap tables | Directory trees of upstream structure |
| Recommendations (Add / Skip / Keep As-Is) | Upstream project name beyond a generic mention |

Structure: Executive Summary → Gaps Identified → Lessons Learned → Recommendations → Decisions Locked In.

After writing, re-read and redact any leaked upstream specifics.

**5. Commit the sync doc.** Stage only the sync doc file. This commit happens BEFORE any template updates.

**6. Apply updates.** Implement each item from the Add to Template section:

- Abstract upstream specifics with `[PLACEHOLDER]` markers
- Match existing template skill/doc style (read neighbors first)
- Register new files in `README.md` file index
- Add entries to `CHANGELOG.md` under `[Unreleased]`
- Track progress with TaskCreate/TaskUpdate

**7. Commit the updates.** Stage only session files explicitly — never `git add -A` (can include stale untracked files like `settings.local.json`). Reference the sync doc commit in the message.

## Common Mistakes

- **Leaking upstream specifics** (file paths, service names, domain terms) into the sync doc
- **Continuing the superpowers pipeline after brainstorming** — STOP there, never invoke `writing-plans`
- **Writing to `docs/plans/` instead of `_template/sync/`**
- **Combining the two commits** — sync doc first, updates second, never combine
- **Syncing backward** — if the template is more mature than upstream (e.g., review skills), keep template
- **Changing the changelog format** — keep `[Unreleased]`; the `release-skill` depends on it

## Related

- [`_template/sync/`](../../../_template/sync/) — historical sync analyses
