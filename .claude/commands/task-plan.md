# Task Planning

Plan a new feature using structured task folders in `_tasks/`.

## Usage

This command invokes the task-plan skill. See `.claude/skills/task-plan-skill/SKILL.md` for templates and detailed workflow.

## Quick Steps

1. **Brainstorm first** (if `superpowers:brainstorming` available, otherwise discuss with user)
2. Find next folder number in `_tasks/`
3. Create `{NN}-{feature-name}/01-task.md` with requirements
4. Create `02-plan.md` with implementation steps (use `superpowers:writing-plans` if available)
5. Commit planning docs BEFORE implementation

## When to Use

- Features spanning multiple files
- Multi-session work
- Complex changes requiring design-first thinking

## Example

See `_tasks/00-example/` for sample task and plan files.
