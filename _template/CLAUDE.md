# Template Development Guide

This folder is for **maintaining the template itself**. It is NOT copied to projects using the template.

## How Projects Use This Template

From the README:

> Tell your agent: "Set up AI-assisted development workflows based on [this repo URL]"
> The agent will read this template, copy relevant files, and adapt `[PLACEHOLDER]` values.

The agent:
1. Reads this template repository
2. Identifies which files to copy (see README File Index)
3. Adapts `[PLACEHOLDER]` markers to the target project
4. Skips `_template/` and example files

## How This Template Evolves

Patterns are refined through real-world usage, then synced back here:

```
Upstream Project (battle-tested) → Sync Analysis → Template (abstracted)
```

See [`workflows/upstream-sync.md`](workflows/upstream-sync.md) for the sync process.

## Folder Structure

```
_template/
├── CLAUDE.md           # This file
├── sync/               # Historical sync analyses
│   └── YYYY-MM-DD-*.md # Dated analysis documents
└── workflows/          # Template maintenance workflows
    └── upstream-sync.md
```

## Key Principles

### Abstraction

- Replace project-specific values with `[PLACEHOLDER]` markers
- Keep skills language/framework agnostic where possible
- Document customization in `.claude/SETUP.md`

### 80/20 Rule

From sync analyses: "Focus on automation that enforces quality, not comprehensive documentation."

- Skills that enforce quality → High priority
- Skills that duplicate superpowers → Skip
- Documentation without enforcement → Lower priority

### Don't Duplicate

Superpowers provides many capabilities. This template should:

- **Complement**: Add project-specific workflows superpowers doesn't have
- **Orchestrate**: Combine superpowers skills into project workflows
- **Reference**: Point to superpowers skills, don't recreate them
