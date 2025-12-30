---
name: release-skill
description: Use when creating a new version release with proper versioning and changelog
---

# Release Workflow Skill

This skill guides the creation of properly versioned releases.

## When to Apply

- Ready to publish a new version
- Accumulated changes in `[Unreleased]` should be released
- Milestone reached

## Prerequisites

Before releasing:
- [ ] All tests passing
- [ ] No uncommitted changes
- [ ] `[Unreleased]` section has entries
- [ ] Build succeeds

## Workflow

### Step 1: Check Current Version

Find current version in your version file(s):

```bash
# Example for Node.js
cat package.json | grep '"version"'

# Example for Rust
cat Cargo.toml | grep '^version'

# Example for Python
cat pyproject.toml | grep '^version'
```

### Step 2: Determine Version Bump

| Type | When to Use | Example |
|------|-------------|---------|
| **patch** | Bug fixes, minor improvements | 1.2.3 → 1.2.4 |
| **minor** | New features, backwards compatible | 1.2.3 → 1.3.0 |
| **major** | Breaking changes | 1.2.3 → 2.0.0 |

Ask user if unclear: "This release includes [summary]. Should this be a patch, minor, or major version bump?"

### Step 3: Update Version Files

Update version string in ALL locations:

- `[VERSION_FILE_1]`
- `[VERSION_FILE_2]`

### Step 4: Update CHANGELOG.md

Transform:
```markdown
## [Unreleased]

### Added
- Feature X
- Feature Y
```

To:
```markdown
## [Unreleased]

### Added
### Changed
### Fixed
### Removed

## [X.Y.Z] - YYYY-MM-DD

### Added
- Feature X
- Feature Y
```

### Step 5: Verify Build

Run your build and test commands:

```bash
[BUILD_COMMAND]
[TEST_COMMAND]
```

**Do not proceed if build fails.**

### Step 6: Commit Release

```bash
git add .
git commit -m "chore: release vX.Y.Z"
```

### Step 7: Tag Version

```bash
git tag vX.Y.Z
```

### Step 8: Push

```bash
git push && git push --tags
```

## Post-Release

After pushing:
1. Verify CI/CD pipeline succeeds (if applicable)
2. Create GitHub release (if applicable)
3. Announce release (if applicable)

## Customization Required

Before using this skill, customize these placeholders in `.claude/commands/release.md`:

| Placeholder | Replace With |
|-------------|--------------|
| `[VERSION_FILE]` | Your main version file |
| `[OTHER_VERSION_LOCATIONS]` | Other files with version strings |
| `[BUILD_COMMAND]` | Your build command |
| `[TEST_COMMAND]` | Your test command |

## Rollback

If something goes wrong after tagging but before pushing:
```bash
git tag -d vX.Y.Z
git reset --hard HEAD~1
```

If already pushed, coordinate with team before any rollback actions.

## Related Skills

- **changelog-skill** - Maintains the `[Unreleased]` section this skill transforms
- **task-plan-skill** - Releases often follow completion of planned tasks
