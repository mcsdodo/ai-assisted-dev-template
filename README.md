# CLAUDE.md Template for AI-Assisted Development

A template for structuring AI guidance files (CLAUDE.md) in your projects. Designed to work with [Claude Code](https://claude.ai/code) and the [Superpowers](https://github.com/codequalitypro/superpowers-marketplace) skills system.

## What This Is

This template provides a proven structure for guiding AI assistants in your codebase:

- **Documentation-Driven Development** - Ensures AI reads docs before coding and updates them after
- **Locality Principle** - Keeps documentation close to the code it describes
- **Task Planning** - Structured approach for complex, multi-session work
- **Tech Debt Tracking** - Systematic capture and resolution of technical debt

This template works best when combined with **Superpowers skills** - a collection of workflow skills that enforce best practices like brainstorming before coding, test-driven development, and systematic debugging.

## Getting Started

1. Copy all template files to your project root:
   - `CLAUDE.md` - Main AI guidance
   - `DECISIONS.md` - Decision log
   - `CHANGELOG.md` - Version history
   - `CONTRIBUTING.md` - Contribution guidelines
   - `_tasks/` folder - Task planning
   - `.claude/` folder - Commands and skills
2. Search for `[PLACEHOLDER]` markers and replace with your project specifics
3. Update the documentation hierarchy diagram in `CLAUDE.md` to match your folder structure
4. Delete or keep `_tasks/00-example/` as a reference

## File Overview

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Main AI guidance - documentation workflow, project structure, conventions |
| `DECISIONS.md` | Architecture Decision Records (ADRs) and business logic decisions |
| `CHANGELOG.md` | Version history using Keep a Changelog format |
| `CONTRIBUTING.md` | Contribution guidelines, TDD workflow, PR process |
| `_tasks/CLAUDE.md` | Task planning structure for complex features |
| `_tasks/_TECH_DEBT/CLAUDE.md` | Technical debt tracking guidelines |
| `_tasks/00-example/` | Example task folder showing the pattern |
| `.claude/commands/` | Slash commands for common workflows |
| `.claude/skills/` | Skills that power the slash commands |

## Core Concepts

### Documentation-Driven Development

Every code change follows this workflow:

```
1. READ documentation FIRST (understand patterns/architecture)
2. WRITE code (following documented conventions)
3. UPDATE documentation (reflect your changes)
```

### Locality Principle

Documentation lives close to the code it documents:

- Service changes → Update service's README
- Infrastructure changes → Update infrastructure docs
- Cross-cutting changes → Update root docs

### Task Planning

Complex features get their own folder in `_tasks/`:

```
_tasks/
├── 01-feature-name/
│   ├── 01-task.md      # Requirements
│   ├── 02-plan.md      # Implementation plan
│   └── 03-design.md    # Architecture decisions
```

## Slash Commands

This template includes Claude Code slash commands for common workflows:

| Command | Description |
|---------|-------------|
| `/task-plan` | Plan features with brainstorming before coding |
| `/decision` | Record architectural and business decisions |
| `/changelog` | Update changelog after completing work |
| `/release` | Create versioned releases |

Commands are defined in `.claude/commands/` with supporting skills in `.claude/skills/`.

### Why Skills Have `-skill` Suffix

Skill folder names use a `-skill` suffix (e.g., `task-plan-skill/`) to work around a Claude Code bug where skill folder names matching command names can cause conflicts. The suffix ensures clean separation between commands and their supporting skills.

## Customization Guide

### Required Customizations

Search for these placeholders and replace them:

- `[PROJECT_NAME]` - Your project name
- `[PROJECT_DESCRIPTION]` - Brief project description
- `[SERVICE_FOLDER]` - Your services/components folder name
- `[INFRASTRUCTURE_FOLDER]` - Your infrastructure folder name (terraform, pulumi, etc.)
- `[DEPLOYMENT_FOLDER]` - Your deployment scripts folder

### Optional Additions

Consider adding project-specific sections for:

- **Database Access Patterns** - Connection, authentication, common queries
- **Deployment Workflows** - Build, deploy, rollback procedures
- **Environment Variables** - Required configuration
- **Code Conventions** - Language-specific patterns, naming conventions
- **Common Commands** - Frequently used CLI commands

## Links

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [CLAUDE.md Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Superpowers Skills](https://github.com/codequalitypro/superpowers-marketplace) - Workflow skills for Claude Code

## License

This template is provided as-is for use in any project.
