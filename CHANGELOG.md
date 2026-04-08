# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- 5-section CLAUDE.md structure (Behavior & Rules → Project Context → Workflows → Environment & Tooling → Technical Reference)
- Research Accuracy rules (3 anti-hallucination guardrails) in CLAUDE.md Section 1
- Test-Driven Development mandate (optional) in CLAUDE.md Section 1
- `.claude/settings.json` with permissions allowlist and hooks configuration
- `.claude/hooks/post-commit-reminder.sh` — blocking changelog reminder after `git commit`
- `.claude/rules/` folder with README and example for path-scoped context loading (native Claude Code feature)
- `updating-docs-skill` — extracts documentation locality logic into an invokable skill
- `move-to-done-skill` — verify-and-archive lifecycle for tasks and tech debt
- `upstream-sync-skill` — end-to-end workflow for syncing refinements from a descendant project
- `_tasks/_done/` and `_tasks/_TECH_DEBT/_done/` archive folders
- `_tasks/TASK-STATUS-INDEX.md` — central task status dashboard with Change Log

### Changed

- `_tasks/CLAUDE.md` and `_tasks/_TECH_DEBT/CLAUDE.md` now document the `_done/` archive convention and require Glob-both when finding the next NN (prevents collisions with archived tasks)
- `task-plan-skill` now registers new tasks in `TASK-STATUS-INDEX.md` and uses Glob-both for next-NN detection
- Documentation references `skill-name` instead of slash commands (e.g., `changelog-skill` instead of `/changelog`)
- CLAUDE.md and README.md now list "Skills" table instead of "Slash Commands"

### Fixed

- `_tasks/_TECH_DEBT/CLAUDE.md` — stale `/move-to-done` slash reference → `move-to-done-skill`
- `.claude/skills/release-skill/SKILL.md` — pointed at deleted `.claude/commands/release.md`; now refers to SKILL.md itself + `SETUP.md`
- `updating-docs-skill` trimmed from 670 → 303 words; removed duplicated Quick Reference table and now links to `CLAUDE.md` Documentation Reference Guide instead
- `move-to-done-skill` trimmed from 657 → 439 words; cut "Why Archive" rationale and "Integration With Other Skills" filler
- `task-plan-skill` trimmed from 508 → 443 words; cut duplicated "Key Conventions" section and brainstorming-fallback narrative
- Post-commit hook now also cleans up `tmpclaude-*` and Windows `NUL`/`nul` stray files (was dropped during initial abstraction)
- `_template/sync/2026-04-08-upstream-sync.md` annotated to note that the `.claude/commands/move-to-done.md` listed in its scope preview was subsequently removed in the same session

### Added

- `_tasks/TODOs.md` — lightweight scratchpad/inbox for items not yet worth a full task folder

### Removed

- `.claude/commands/` folder — commands were merged into skills; slash command wrappers no longer needed
- `_template/workflows/` folder — upstream sync workflow is now the `upstream-sync-skill`
