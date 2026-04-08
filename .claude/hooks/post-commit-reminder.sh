#!/bin/bash
# PostToolUse hook: cleanup stray temp files + remind to update CHANGELOG after git commits.
#
# Fires on every Bash tool use. Always cleans up temp artifacts (tmpclaude-*,
# stray NUL/nul files from Git Bash on Windows). Additionally surfaces a
# changelog reminder when the command was a `git commit` that did not already
# touch CHANGELOG. Uses exit code 2 + stderr so Claude Code shows the reminder
# as a blocking message.

input=$(cat)
[ -z "$input" ] && exit 0

# Always: clean up tmpclaude-* files and Windows NUL artifacts (ignore errors).
# These accumulate from Claude Code tool use on Git Bash / MSYS on Windows.
find . -name "tmpclaude-*" -delete 2>/dev/null
find . -maxdepth 1 -name "NUL" -delete 2>/dev/null
find . -maxdepth 1 -name "nul" -delete 2>/dev/null

# Only surface a reminder for git commit commands
if ! echo "$input" | grep -q '"command"[^}]*git commit'; then
    exit 0
fi

# Skip if this commit already references CHANGELOG
if echo "$input" | grep -qi '"command"[^}]*CHANGELOG'; then
    exit 0
fi

# Exit code 2 with stderr output = blocking reminder shown to the agent
echo "REMINDER: Invoke changelog-skill to update CHANGELOG.md [Unreleased]" >&2
exit 2
