---
name: updating-docs-skill
description: Use when completing code changes that require documentation updates, when unsure which files to update, or when adding new services or infrastructure components
---

# Updating Documentation Skill

## Overview

**Locality principle**: Documentation lives close to the code it documents. Update local docs first, root docs only if needed.

This skill extracts the documentation update logic from CLAUDE.md into a dedicated, explicitly invokable workflow. Use it whenever you're about to update docs and want to make sure you touch the right files.

## When to Apply

- After completing any code change that alters behavior, interfaces, or configuration
- When unsure which documentation files need updating
- When adding a new service, component, or infrastructure element
- Before opening a PR, as a final doc sanity check

## Quick Reference — Which Docs to Update

| Change Type | Update First (Local) | Update Second (Root) |
|-------------|---------------------|---------------------|
| Service/Component | Service's own `README.md` | Root README if architecture changes |
| Infrastructure | `[INFRASTRUCTURE_FOLDER]/README.md` | CLAUDE.md if workflow changes |
| Deployment | `[DEPLOYMENT_FOLDER]/README.md` | CLAUDE.md if workflow changes |
| Tests | Service's `tests/README.md` | Service README if strategy changes |
| Config schema | Service README + `.yaml.example`/`.env.example` | Root docs if setup affected |
| Cross-cutting | Root `README.md` + `CLAUDE.md` | (none — already at root) |

## Locality Rules

- **Detailed docs** → local to the component (e.g., `[SERVICE_FOLDER]/[service-name]/README.md`)
- **High-level overview** → root `README.md`
- **Agent conventions** → root `CLAUDE.md` or component `CLAUDE.md` / `.claude/rules/`
- **Never duplicate** detailed info in multiple places — use links

## Workflow

### Step 1: Identify What Changed

List the files you modified and categorize each:

- Service code → goes with service docs
- Infrastructure → goes with infra docs
- Shared utilities → goes with shared-code docs
- Config → goes with service docs + example files
- Tests → goes with test docs

### Step 2: Apply the Locality Rule

For each category, update the **local** docs first. Only touch root docs if:

- Architecture overview changed
- User-facing setup/usage changed
- A service was added or removed
- Development conventions changed (CLAUDE.md only)

### Step 3: Use the Update Checklist

**Local docs updated?**

- [ ] Service README if service code changed
- [ ] Infrastructure README if infra changed
- [ ] Deployment README if deploy scripts changed
- [ ] Test docs if tests changed
- [ ] Config examples (`.env.example`, `config.yaml.example`) if schema changed

**Root docs needed?**

- [ ] Root `README.md` — only if architecture changed, setup/usage changed, or a service was added/removed
- [ ] Root `CLAUDE.md` — only if development conventions changed

**Quality check:**

- [ ] All markdown links valid (no broken references)
- [ ] File references use clickable links (e.g., `[filename.ts:42](path/to/file.ts#L42)`)
- [ ] No duplication between local and root docs (use links, not copies)
- [ ] Examples are accurate and runnable

### Step 4: Commit Docs With Code

Include doc updates in the same commit as the code change they describe:

```bash
git add path/to/code.ext path/to/README.md
git commit -m "feat: [description]"
```

Don't batch doc updates for later — stale docs are worse than no docs.

## Common Mistakes

- Adding CLI details to root README instead of service README
- Duplicating infrastructure details in root docs instead of linking
- Forgetting to update config examples when schema changes
- Skipping doc updates for "small" changes (outdated docs are worse than no docs)
- Updating root CLAUDE.md for component-specific rules (use `.claude/rules/` instead)

## Integration With Other Skills

- **task-plan-skill** — Plans should list which docs will be updated
- **verify-skill** — Verification checks that docs were updated before marking work complete
- **code-review-skill** — Reviews include a "docs updated?" check
- **changelog-skill** — Changelog is a separate doc, not covered by this skill

## Related

- Root `CLAUDE.md` — Documentation Policy and Reference Guide sections
- `.claude/rules/` — For component-specific rules that don't belong in global docs
