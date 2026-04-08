---
name: updating-docs-skill
description: Use when completing code changes that require documentation updates, when unsure which files to update, or when adding new services or infrastructure components
---

# Updating Documentation

**Locality principle**: documentation lives close to the code it describes. Update local docs first; touch root docs only when architecture, user-facing setup, or development conventions change.

See the **Documentation Reference Guide** in [`CLAUDE.md`](../../../CLAUDE.md) for the full table of what to read and update per change type — this skill is the invokable complement that walks through applying it.

## Workflow

1. **Identify what changed.** List modified files. Categorize each: service code, infrastructure, tests, config, cross-cutting.

2. **Update local docs first.** Each category has an owner:
   - Service code → service's own `README.md`
   - Infrastructure → `[INFRASTRUCTURE_FOLDER]/README.md`
   - Deployment → `[DEPLOYMENT_FOLDER]/README.md`
   - Tests → service's `tests/README.md`
   - Config schema → service README + `.env.example` / `config.yaml.example`

3. **Update root docs only when needed.**
   - Root `README.md` — architecture changed, user-facing setup/usage changed, service added/removed
   - Root `CLAUDE.md` — development conventions changed
   - `.claude/rules/` — component-specific rules that shouldn't bloat CLAUDE.md

4. **Quality check.**
   - [ ] Markdown links valid
   - [ ] File references clickable (e.g., `[file.ts:42](path/to/file.ts#L42)`)
   - [ ] No duplication between local and root docs — use links
   - [ ] Examples accurate

5. **Commit docs with code** in the same commit. Stale docs are worse than no docs — don't batch them.

## Common Mistakes

- Adding CLI details to root README instead of service README
- Duplicating infrastructure details in root docs instead of linking
- Forgetting config examples when schema changes
- Skipping "small" changes — outdated docs compound
- Updating root CLAUDE.md for component-specific rules (use `.claude/rules/`)

## Related

- [`CLAUDE.md`](../../../CLAUDE.md) — Documentation Policy, Locality Principle, and Reference Guide
- `.claude/rules/` — path-scoped rules for component-specific guidance
