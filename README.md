# AI-Assisted Development Template

My opinionated template for structuring AI guidance files in projects. Works with [Claude Code](https://claude.ai/code) and [Superpowers](https://github.com/codequalitypro/superpowers-marketplace).

## Usage

Tell your agent:

> "Set up AI-assisted development workflows based on https://github.com/mcsdodo/ai-assisted-dev-template"

The agent will:
1. Read this template's structure
2. Copy relevant files to your project
3. Adapt `[PLACEHOLDER]` values to your project

## What's Included

| File | Purpose |
|------|---------|
| `CLAUDE.md` | AI guidance - documentation workflow, conventions. `[PLACEHOLDER]` markers indicate what to adapt. |
| `DECISIONS.md` | Architecture and business logic decisions (ADR/BIZ format) |
| `CHANGELOG.md` | Version history ([Keep a Changelog](https://keepachangelog.com/) format) |
| `_tasks/` | Task planning for complex features |
| `.claude/commands/` | Slash commands: `/task-plan`, `/decision`, `/changelog`, `/release` |
| `.claude/skills/` | Skills powering the commands |

## Core Concepts

- **Documentation-Driven Development**: Read docs → Code → Update docs
- **Locality Principle**: Docs live close to the code they describe
- **Task Planning**: Complex features get `_tasks/{NN}-{name}/` folders

## Links

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)
- [Superpowers Skills](https://github.com/codequalitypro/superpowers-marketplace)
