# .claude/rules/

Path-scoped context rules for Claude Code. This is a **native Claude Code feature** — no manual loading is required.

## How It Works

Claude Code automatically loads rule files from this directory:

| Frontmatter | Load Behavior |
|-------------|---------------|
| `paths:` with glob patterns | Auto-loaded **only** when matching files enter context |
| No `paths:` frontmatter | Loaded at session start (like CLAUDE.md, but topic-scoped) |

Subdirectories work automatically (e.g., `.claude/rules/frontend/react.md` is discovered).

## When to Use

Use rules for:

- **Component-specific conventions** that don't belong in global CLAUDE.md
- **Trimming CLAUDE.md** once it grows beyond ~200 lines
- **Path-scoped context** that only matters when working in a specific area (e.g., API rules, frontend rules, testing rules)

Use CLAUDE.md for:

- **Global rules** that apply to every task
- **High-level project context** (architecture, conventions, workflows)

## File Format

```markdown
---
paths:
  - "[SERVICE_FOLDER]/[service-name]/**/*.[ext]"
  - "[SERVICE_FOLDER]/[service-name]/[component].py"
---

# [Component Name] Rules

Key conventions when working in this component.

## Key Files

| File | What to change here |
|------|---------------------|
| `path/to/file` | Description |

## Design Constraints

- Constraint 1 (with reasoning — the *why* matters more than the *what*)
- Constraint 2

## Debugging

Commands and patterns specific to this component.
```

## Important Caveats

Rules are **guidance Claude reads**, not enforcement. For guaranteed behavior:

- **Permissions** → Use `.claude/settings.json` permissions allowlist
- **Automation** → Use `.claude/hooks/` (pre/post tool-use scripts)

## Example

See [`_example.md`](_example.md) in this directory for a complete template rule file.

## Reference

[Claude Code documentation — `.claude/rules/`](https://code.claude.com/docs/en/claude-directory.md#organize-rules-with-claude/rules/)
