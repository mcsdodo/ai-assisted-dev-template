# AI-Assisted Development Template

My opinionated template for structuring AI guidance files in projects. Works with [Claude Code](https://claude.ai/code) and [Superpowers](https://github.com/codequalitypro/superpowers-marketplace).

## Usage

Tell your agent:

> "Set up AI-assisted development workflows based on https://github.com/mcsdodo/ai-assisted-dev-template"

The agent will read this template, copy relevant files, and adapt `[PLACEHOLDER]` values to your project.

## File Index

### Adapt to Project

These files contain `[PLACEHOLDER]` markers that the agent should replace with project-specific values:

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Main AI guidance - documentation workflow, project structure, conventions |
| `.claude/skills/release-skill/SKILL.md` | Release workflow - version files, build/test commands |
| `.claude/SETUP.md` | Customization guide for release workflow |

### Copy As-Is

These files work out of the box - copy without modification.

> **Note on Superpowers Integration:** The review/planning skills below are **orchestration layers**, not replacements for Superpowers. They invoke Superpowers skills internally while adding structured workflows. Use both together.
>
> | Template Skill | Superpowers Used | What Template Adds |
> |----------------|------------------|-------------------|
> | `task-plan-skill` | `brainstorming`, `writing-plans` | Structured `_tasks/{NN}-{name}/` folders with `01-task.md`, `02-plan.md` templates |
> | `verify-skill` | Recommends `verification-before-completion` | Lightweight checklist + changelog/git status checks |
> | `code-review-skill` | `code-reviewer` | 2-phase workflow (findings → approval → fixes), `_code-review.md` artifact, max 4 iterations |
> | `plan-review-skill` | *(standalone)* | Reviews existing plans, `_plan-review.md` artifact, iterative quality gate |
> | `test-review-skill` | *(standalone)* | Coverage gap analysis, `_test-review.md` artifact, iterative quality gate |

| File | Purpose |
|------|---------|
| `CHANGELOG.md` | Version history ([Keep a Changelog](https://keepachangelog.com/) format) |
| `DECISIONS.md` | Decision log (ADR/BIZ format) |
| `_tasks/CLAUDE.md` | Task planning conventions |
| `_tasks/_TECH_DEBT/CLAUDE.md` | Tech debt documentation guidelines |
| `.claude/commands/task-plan.md` | `/task-plan` command |
| `.claude/commands/decision.md` | `/decision` command |
| `.claude/commands/changelog.md` | `/changelog` command |
| `.claude/commands/verify.md` | `/verify` command |
| `.claude/commands/release.md` | `/release` command |
| `.claude/skills/task-plan-skill/SKILL.md` | Task planning workflow |
| `.claude/skills/decision-skill/SKILL.md` | Decision recording workflow |
| `.claude/skills/changelog-skill/SKILL.md` | Changelog update workflow |
| `.claude/skills/verify-skill/SKILL.md` | Verification before completion |
| `.claude/skills/code-review-skill/SKILL.md` | Iterative code review (max 4 iterations) |
| `.claude/skills/plan-review-skill/SKILL.md` | Plan/design review |
| `.claude/skills/test-review-skill/SKILL.md` | Test coverage review |

### Examples Only (Reference)

These exist to show patterns - understand them, then delete:

| File | Purpose |
|------|---------|
| `_tasks/00-example/01-task.md` | Example task description |
| `_tasks/00-example/02-plan.md` | Example implementation plan |
| `_tasks/_TECH_DEBT/README.md` | Example tech debt index table |

### Template Maintenance (Skip)

These are for maintaining the template itself - **do not copy to projects**:

| File | Purpose |
|------|---------|
| `_template/` | Template development docs, sync analyses, workflows |

## Core Concepts

- **Documentation-Driven Development**: Read docs → Code → Update docs
- **Locality Principle**: Docs live close to the code they describe
- **Task Planning**: Complex features get `_tasks/{NN}-{name}/` folders

## Slash Commands

| Command | Purpose |
|---------|---------|
| `/task-plan` | Plan complex features with structured task folders |
| `/decision` | Record architectural (ADR) or business (BIZ) decisions |
| `/changelog` | Update changelog immediately after completing work |
| `/verify` | Run verification checks before marking work complete |
| `/release` | Bump version, update changelog, commit, tag, push |

## Links

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- [Superpowers Skills](https://github.com/codequalitypro/superpowers-marketplace)
