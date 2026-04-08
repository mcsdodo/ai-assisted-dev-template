#!/bin/bash
# PostToolUse hook: remind the agent to update CHANGELOG.md after a git commit.
#
# Fires on every Bash tool use, but only surfaces a message when the command
# was a `git commit` that did not already touch CHANGELOG. Uses exit code 2 +
# stderr so Claude Code shows the reminder as a blocking message.

input=$(cat)
[ -z "$input" ] && exit 0

# Only react to git commit commands
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
