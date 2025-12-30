---
name: changelog-skill
description: Use immediately after completing any feature or fix to update CHANGELOG.md
---

# Changelog Update Skill

This skill ensures CHANGELOG.md stays current with all changes.

## Key Principle

**Update IMMEDIATELY when completing work.**

Don't batch up changes. Don't wait until release. Update as you finish each piece of work.

## When to Apply

After completing:
- New features
- Bug fixes
- Behavior changes
- Removals
- Security fixes

## Categories

| Category | Use For |
|----------|---------|
| **Added** | New features, new capabilities |
| **Changed** | Changes to existing functionality |
| **Deprecated** | Features marked for future removal |
| **Removed** | Features that were removed |
| **Fixed** | Bug fixes |
| **Security** | Security-related changes |

## Workflow

### Step 1: Review What Changed

Ask: "What did the user gain or experience differently?"

Focus on impact, not implementation.

### Step 2: Choose Category

Pick the single most appropriate category for each change.

### Step 3: Write Entry

Add under the appropriate category in `[Unreleased]`:

```markdown
## [Unreleased]

### Added
- [Your new entry here]
```

### Step 4: Commit with Code

Include changelog update in the same commit as the code:

```bash
git add .
git commit -m "feat: [description]"
```

## Writing Guidelines

### Do

- Be concise (one line per change)
- Focus on user-visible impact
- Use consistent terminology
- Start with a verb (Add, Fix, Update, Remove)

### Don't

- Include file names or paths
- Use technical jargon
- Describe internal refactoring
- Write multi-line entries

## Examples

### Good Entries

```markdown
### Added
- Dark mode theme option
- Export to PDF functionality
- Keyboard shortcuts for common actions

### Fixed
- Login timeout now redirects properly
- Search results respect date filters
- Memory leak when switching views

### Changed
- Improved loading speed for large datasets
- Updated date format to ISO standard
```

### Bad Entries (Avoid)

```markdown
### Added
- Added ThemeContext.tsx and useTheme.ts hook for dark mode
- Implemented PDFExporter class using jsPDF library
```

## Integration with Release

When running `/release`:
1. The `[Unreleased]` section becomes a versioned section
2. A new empty `[Unreleased]` section is created
3. The release workflow handles the transformation

## Related Skills

- **release-skill** - Transforms `[Unreleased]` into versioned releases
- **decision-skill** - Significant decisions may warrant changelog entries
- **task-plan-skill** - Completed tasks should trigger changelog updates
