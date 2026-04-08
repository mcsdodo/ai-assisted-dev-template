---
paths:
  - "[SERVICE_FOLDER]/[service-name]/**/*.[ext]"
  - "[SERVICE_FOLDER]/[service-name]/[key-file].[ext]"
---

# [Component Name] Rules

> **Template example** — delete or adapt to a real component. This file demonstrates the path-scoped rule format.

Brief one-paragraph description of what this component does and why it has its own rules.

See [[Component] Architecture](../../[path-to-arch-doc].md) for the full design decisions.

## Key Files

| File | What to change here |
|------|---------------------|
| `[path/to/entrypoint]` | Public API, entry points |
| `[path/to/config]` | Configuration schema, defaults |
| `[path/to/core-logic]` | Business logic, orchestration |
| `[path/to/tests]` | Test fixtures, integration tests |

## Design Constraints

- **[Constraint 1]** — why it exists (past incident, performance requirement, compliance rule, etc.)
- **[Constraint 2]** — the reasoning behind the rule; knowing *why* helps judge edge cases
- **[Constraint 3]** — explicit anti-pattern with a reason

## Common Mistakes

- [Mistake 1 with fix]
- [Mistake 2 with fix]

## Debugging

```bash
# Common debugging commands for this component
[command]

# Log filters
[command]

# State inspection
[command]
```

## Related

- [Link to related rules, docs, or CLAUDE.md sections]
