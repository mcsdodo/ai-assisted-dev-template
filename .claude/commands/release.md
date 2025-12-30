# Create Release

Create a new version release with proper versioning and changelog.

## Usage

This command invokes the release skill. See `.claude/skills/release-skill/SKILL.md` for the full workflow.

## Quick Steps

1. Check current version
2. Determine bump type (patch/minor/major)
3. Update version in all locations
4. Move `[Unreleased]` to new version section
5. Verify build passes
6. Commit, tag, and push

## Customization Required

Before using, replace placeholders in the skill file:
- `[VERSION_FILE]` - Your main version file
- `[BUILD_COMMAND]` - Your build command
- `[TEST_COMMAND]` - Your test command
