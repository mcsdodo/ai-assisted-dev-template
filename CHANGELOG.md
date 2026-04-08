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

### Removed

- `.claude/commands/` folder — commands were merged into skills; slash command wrappers no longer needed
- `_template/workflows/` folder — upstream sync workflow is now the `upstream-sync-skill`
