# Upstream Sync Workflow

This template evolves through real-world usage. When patterns are refined in production projects, sync improvements back here.

## When to Sync

- Periodically (monthly/quarterly)
- After significant workflow evolution in upstream project
- When new skills/patterns emerge from real usage

## Workflow

### Step 1: Identify Sync Window

Find this template's last relevant commit:

```bash
git log -1 --format="%ci" HEAD
```

This is your baseline time (T). You'll analyze upstream changes since T.

### Step 2: Gather Upstream Changes

From the upstream project, collect:

1. **Commits since T** - What changed?
2. **CLAUDE.md** - Core guidance evolution
3. **Skills** (`.claude/skills/`) - New or modified workflows
4. **Commands** (`.claude/commands/`) - New slash commands
5. **Hooks** (`.claude/hooks/`, `settings.json`) - Automation patterns
6. **Task analyses** (`_tasks/`) - Documented learnings

### Step 3: Create Analysis

Create `_template/sync/YYYY-MM-DD-sync.md`:

```markdown
# Sync Analysis: YYYY-MM-DD

**Baseline:** [this template's commit date]
**Upstream commits analyzed:** [count]

## Changes Identified

### Skills
- [New/modified skills]

### Commands
- [New/modified commands]

### CLAUDE.md
- [Sections added/changed]

### Hooks/Automation
- [New patterns]

## Lessons Learned

[Key insights from upstream evolution]

## Recommendations

### Add to Template
- [Items to add, with reasoning]

### Skip (Project-Specific)
- [Items that don't generalize]

## Implementation Plan

[Concrete changes to make]
```

### Step 4: Iterate on Analysis

Review analysis multiple times:

1. **Iteration 1**: Capture everything
2. **Iteration 2**: Draft concrete implementations
3. **Iteration 3**: Check edge cases, validate against 80/20 principle
4. **Iteration 4**: Finalize implementation plan

### Step 5: Abstract to Template

For each change, ask:

| Question | If Yes | If No |
|----------|--------|-------|
| Works without project specifics? | Add as-is | Abstract or skip |
| Uses placeholders appropriately? | Good | Add `[PLACEHOLDER]` markers |
| Duplicates superpowers? | Skip | Add |
| Enforces quality? | High priority | Lower priority |

### Step 6: Implement and Document

1. Create/update files per implementation plan
2. Update README.md file index
3. Update SETUP.md if new customization needed
4. Commit with clear message referencing sync

## Key Principles

**80/20 Rule**: Focus on automation that enforces quality, not comprehensive documentation.

**Don't Duplicate**: If superpowers provides it, reference don't recreate.

**Abstract Properly**: Replace project-specific values with `[PLACEHOLDER]` markers.

**Preserve Reasoning**: Store analysis in `_template/sync/` for future reference.
