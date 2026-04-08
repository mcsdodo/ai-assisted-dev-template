# Sync Analysis: 2026-04-08

**Date:** 2026-04-08
**Baseline (this template):** 2026-01-07 14:10 (commit `1a003b3`)
**Upstream project:** Production project that descended from this template (~3 months real-world usage)
**Scope:** Full template comparison — CLAUDE.md, skills, commands, hooks, rules, task conventions

---

## Executive Summary

The upstream project started from this template and iterated on its patterns during real-world use. Three months of usage surfaced **refinements to existing skills**, **new skills born from repeated workflows**, and **native Claude Code features** (hooks, rules, settings) that this template hasn't adopted yet.

### Key Findings

1. **CLAUDE.md is organized into 5 sections** (BEHAVIOR & RULES → PROJECT CONTEXT → WORKFLOWS → ENVIRONMENT & TOOLING → TECHNICAL REFERENCE). Much easier to navigate than the template's flatter layout.
2. **`.claude/rules/` is a native Claude Code feature** for path-scoped context loading — the template doesn't use it.
3. **`.claude/hooks/` + `settings.json`** — a post-commit changelog reminder hook fires automatically after `git commit`. Template has no hooks/settings files.
4. **Two generalizable new skills**: `updating-docs` (extracts the locality-principle logic into a dedicated skill) and `move-to-done` (verify-before-archive lifecycle for tasks and tech debt).
5. **`_done/` archive convention** for completed tasks and tech debt, plus `TASK-STATUS-INDEX.md` as a central dashboard.
6. **Anti-hallucination rules** in CLAUDE.md (the three Anthropic research-accuracy guardrails) + TDD hard mandate.

### Evolution Pattern

Upstream added very few new commands but invested heavily in **passive automation** (hooks, rules, path-scoped loading) and **lifecycle skills** (updating-docs, move-to-done). The pattern: "make the right thing automatic, make the wrong thing impossible." This matches the template's 80/20 principle (automation over documentation).

---

## Detailed Comparison

### 1. CLAUDE.md Structure

| Aspect | Template (Current) | Upstream | Action |
|--------|--------------------|----------|--------|
| Organization | Flat sections, no numbering | 5 numbered sections with clear scoping | **Adopt** |
| Research accuracy rules | None | 3 Anthropic guardrail rules | **Adopt** |
| TDD mandate | None | Hard rule (RED → Verify → GREEN → Verify → REFACTOR) | **Adopt (optional)** |
| Path-scoped rules | Not mentioned | Native `.claude/rules/` referenced | **Adopt** |

**Section mapping for adoption:**

```
# 1. BEHAVIOR & RULES       ← always active
    - Documentation-Driven Development
    - Research Accuracy (NEW)
    - Test-Driven Development (NEW, optional)
    - Git Commit Guidelines
    - Path-scoped rules pointer (NEW)

# 2. PROJECT CONTEXT        ← read before touching code
    - Project Overview
    - Architecture
    - Documentation Policy + Locality Principle
    - Documentation Reference Guide
    - Key Documentation

# 3. WORKFLOWS              ← how to perform common tasks
    - Task Planning Folder
    - Decisions Log
    - Changelog
    - Slash Commands
    - Task Completion Checklist

# 4. ENVIRONMENT & TOOLING  ← consult when relevant
    - File Encoding Standards
    - OS-specific notes (placeholder)

# 5. TECHNICAL REFERENCE    ← look up as needed
    - Environment Variables
    - Code Conventions
    - Common Development Commands
```

### 2. Skills Comparison

| Skill | Template | Upstream | Gap Analysis |
|-------|----------|----------|--------------|
| changelog-skill | `[Unreleased]` format | Date-grouped format | **Keep template's** — more standard, works with release-skill |
| code-review-skill | 2-phase, max 4 iter, robust | Simpler 2-phase | **Keep template's** — already more mature |
| plan-review-skill | Robust | Not present | **Keep template's** |
| test-review-skill | Robust | Not present | **Keep template's** |
| decision-skill | Yes | Not present | **Keep template's** |
| release-skill | Yes | Not present | **Keep template's** |
| task-plan-skill | Yes | Not a skill (conventions only) | **Keep template's**, add index-registration step |
| verify-skill | Yes | Not present | **Keep template's** |
| **updating-docs** | **NO** | Yes | **ADD** — extracts locality logic from CLAUDE.md |
| **move-to-done** | **NO** | Yes | **ADD** — verify-before-archive lifecycle |
| Domain-specific skills (create-pr, deploy, smoke-test, debug-*) | NO | Yes | **Skip** — too project-specific |

### 3. Commands Comparison

| Command | Template | Upstream | Action |
|---------|----------|----------|--------|
| /changelog | Yes | Yes | None |
| /decision | Yes | Not present | Keep template's |
| /release | Yes | Not present | Keep template's |
| /task-plan | Yes | Not present | Keep template's |
| /verify | Yes | Not present | Keep template's |
| **/move-to-done** | **NO** | Not a command (skill only) | **ADD** — invoke new skill |

### 4. Hooks + Settings (ENTIRELY MISSING from template)

**`.claude/settings.json`** — upstream has a minimal file configuring permissions allowlist and PostToolUse hooks. Template has none.

**`.claude/hooks/post-commit-reminder.sh`** — bash hook triggered on `git commit`:
- Fires only for `git commit` commands (grep pattern match)
- Skips if the commit message already references CHANGELOG
- Exits with code 2 + stderr message — surfaces the reminder to the agent as a blocking message

**Why this matters:** The template's Task Completion Checklist lists "changelog updated" as a step, but it relies on the agent remembering. A hook makes it automatic. Exit code 2 is the Claude Code mechanism for surfacing hook output to the agent.

**Gap:** Template has no `settings.json`, no `hooks/` directory, no enforcement mechanism.

### 5. `.claude/rules/` Pattern (NATIVE CLAUDE CODE FEATURE)

Upstream uses `.claude/rules/*.md` for path-scoped context. Rules with `paths:` frontmatter auto-load when matching files enter context; rules without `paths:` load universally.

**Example structure:**

```markdown
---
paths:
  - "services/[service-name]/**/[pattern]*.py"
---

# [Component] Rules
...
```

**Verified:** This is a native Claude Code feature (documented at `code.claude.com/docs/en/claude-directory.md#organize-rules-with-claude/rules/`), not a custom convention.

**Use case:** When CLAUDE.md exceeds ~200 lines or when rules are tightly scoped to a specific component. Keeps global CLAUDE.md lean.

**Gap:** Template has no `.claude/rules/` folder, no example, no mention in CLAUDE.md.

### 6. Task Conventions

| Aspect | Template | Upstream | Action |
|--------|----------|----------|--------|
| `_tasks/{NN}-name/` folder pattern | Yes | Yes | None |
| `_tasks/_done/` archive | Not mentioned | Used actively | **Adopt** |
| `_tasks/_TECH_DEBT/_done/` archive | Not mentioned | Used actively | **Adopt** |
| Finding next NN | `ls _tasks/` (misses `_done/`) | Glob both `_tasks/` + `_done/` | **Adopt** — prevent NN collisions |
| `TASK-STATUS-INDEX.md` | None | Central dashboard with Change Log | **Adopt** |
| Task metadata header | `Date/Subject/Status` | Same | None |

**Collision risk:** If `_done/` holds `01-auth/` and a new task is numbered using only `_tasks/` listing, collision becomes possible. The Glob-both pattern prevents this.

---

## Lessons Learned

### What Real-World Use Revealed

1. **Flat CLAUDE.md gets hard to navigate** once projects grow. Section numbering + scoping labels ("always active" / "read before coding" / "look up as needed") gives agents a mental index.
2. **Documentation locality needs a skill**, not just a CLAUDE.md table. When extracted into `updating-docs`, it becomes explicitly invokable and gets used more consistently.
3. **Task archival is a lifecycle stage**, not a one-off. The `_done/` folder + `move-to-done` skill with verify-before-archive prevents "stale plans mixed with active plans" drift.
4. **Hooks are underused.** A single 25-line shell script that forces `/changelog` after commits eliminates an entire class of "I forgot" errors.
5. **`.claude/rules/` is the right answer for component-specific context.** Nested CLAUDE.md files work but are heavier; rules with path frontmatter are lighter and purpose-built.

### Template-Specific Observations

- **Review skills in the template are more mature than upstream's.** The template's 2-phase + max-4-iterations + documented artifact pattern is a refinement upstream hasn't absorbed back. This is an asymmetric sync — template wins on review skills, upstream wins on everything else analyzed here.
- **Keep `[Unreleased]` changelog format.** Upstream uses date-grouped entries, which is simpler but breaks the template's release-skill (which rotates `[Unreleased]` → versioned on release). User confirmed this choice.
- **Skip domain-specific skills.** Upstream has `create-pr`, `deploy`, `smoke-test`, `debug-pr-analysis` that are valuable in their context but don't generalize to a neutral template.

---

## Recommendations

### Add to Template

| # | Item | Rationale | Effort |
|---|------|-----------|--------|
| 1 | Restructure CLAUDE.md into 5 numbered sections | Navigation + scoping | Medium |
| 2 | Add Research Accuracy rules to Section 1 | Anti-hallucination, generic best practice | Low |
| 3 | Add TDD mandate to Section 1 (marked optional) | Strong discipline, easily removed | Low |
| 4 | Create `.claude/settings.json` (minimal) | Enables hooks, declares permissions | Low |
| 5 | Create `.claude/hooks/post-commit-reminder.sh` | Automates changelog reminder | Low |
| 6 | Create `.claude/rules/` with README + `_example.md` | Native feature, keeps CLAUDE.md lean | Low |
| 7 | Create `updating-docs-skill` | Extracts locality logic, invokable | Medium |
| 8 | Create `move-to-done-skill` + `/move-to-done` command | Lifecycle gap + archival discipline | Medium |
| 9 | Create `_tasks/_done/` and `_tasks/_TECH_DEBT/_done/` | Archive convention | Low |
| 10 | Create `_tasks/TASK-STATUS-INDEX.md` | Central dashboard | Low |
| 11 | Update `_tasks/CLAUDE.md` for Glob-both + `_done/` | Prevent NN collisions | Low |
| 12 | Update `task-plan-skill` to register in `TASK-STATUS-INDEX.md` | Keep index current | Low |
| 13 | Update `README.md` file index for all new files | Template discoverability | Low |
| 14 | Changelog entry under `[Unreleased]` | Template's own discipline | Low |

### Skip (Project-Specific)

- Domain-specific skills (`create-pr`, `deploy`, `smoke-test`, `debug-*`) — hardcoded integrations, project-specific workflows
- Date-grouped changelog format — breaks release-skill
- Domain-specific rules in `.claude/rules/` — ship empty folder + example only

### Keep As-Is

- `code-review-skill`, `plan-review-skill`, `test-review-skill` — template versions are more mature
- `changelog-skill` — `[Unreleased]` format is intentional
- `decision-skill`, `release-skill`, `verify-skill` — no learnings to apply

---

## Implementation Plan

Detailed file-by-file plan will be created next via the `writing-plans` skill.

**Scope preview:**

- **Files modified (5):** `CLAUDE.md`, `_tasks/CLAUDE.md`, `_tasks/_TECH_DEBT/CLAUDE.md`, `.claude/skills/task-plan-skill/SKILL.md`, `README.md`
- **Files created (13):** `.claude/settings.json`, `.claude/hooks/post-commit-reminder.sh`, `.claude/skills/updating-docs-skill/SKILL.md`, `.claude/skills/move-to-done-skill/SKILL.md`, `.claude/commands/move-to-done.md`, `.claude/rules/README.md`, `.claude/rules/_example.md`, `_tasks/TASK-STATUS-INDEX.md`, `_tasks/_done/.gitkeep`, `_tasks/_TECH_DEBT/_done/.gitkeep`, plus the CHANGELOG entry

**Decisions locked in from brainstorming:**

- ✅ 5-section CLAUDE.md structure
- ✅ Keep `[Unreleased]` changelog format (not date-grouped)
- ✅ Include `TASK-STATUS-INDEX.md`
- ✅ `.claude/rules/` as native feature (no manual-check caveat — verified)
- ✅ Principle-based with placeholders (no Python/DAPR/Azure specifics)
- ✅ Moderate aggressiveness: refine existing + add new
- ✅ Skip domain-specific skills entirely
