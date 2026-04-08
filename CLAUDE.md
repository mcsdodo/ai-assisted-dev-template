# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> **For agents setting up from template:**
>
> | Content Type | How to Identify | Action |
> |--------------|-----------------|--------|
> | **Placeholders** | `[PLACEHOLDER]` markers like `[PROJECT_DESCRIPTION]`, `[SERVICE_FOLDER]` | Replace with project-specific values |
> | **Principles** | Sections explaining "why" (Documentation-Driven Development, Locality Principle, Quality Standards) | Keep as guidance - these are best practices |
> | **Structure examples** | Directory trees, tables with `[FOLDER]` paths | Adapt paths to match actual project structure |
> | **Optional sections** | File Encoding, TDD mandate, detailed Documentation Policy tables | Keep if relevant, trim if overkill for simple projects |
>
> **Quick guide:** Principles stay, placeholders get replaced, structure adapts to reality.

---

# 1. BEHAVIOR & RULES

Rules in this section are always active and apply to every task.

## Core Principle: Documentation-Driven Development

**MANDATORY WORKFLOW FOR ALL CODE CHANGES:**

```
1. READ documentation FIRST (understand patterns/architecture)
2. WRITE code (following documented conventions)
3. UPDATE documentation (reflect your changes)
```

**Never skip step 1 or 3!** Documentation must always be read before coding and updated after coding.

## Research Accuracy

When performing research, analyzing documents, or making factual claims, follow these three rules ([source](https://docs.anthropic.com/en/docs/test-and-evaluate/strengthen-guardrails/reduce-hallucinations)):

1. **Say "I don't know" when uncertain.** Do not fill knowledge gaps with plausible-sounding fiction. If you lack sufficient information, state that explicitly rather than guessing.
2. **Use direct quotes for factual grounding.** When working with documents or web content, extract word-for-word quotes before analyzing or summarizing. This prevents paraphrase-drift where meaning subtly changes during summarization.
3. **Verify claims with citations.** Every factual claim should have a supporting source. If you cannot find a supporting quote or reference for a claim, retract it rather than presenting it as fact.

**When NOT to apply:** These constraints are for research and factual accuracy. For creative tasks (brainstorming, code generation, architectural design), think freely without citation requirements.

## Test-Driven Development (TDD)

> **OPTIONAL — remove this section if your project doesn't use TDD.**

**MANDATORY for all bug fixes and new features when TDD is adopted.** No production code without a failing test first.

1. **RED** — Write a failing test that demonstrates the desired behavior
2. **Verify RED** — Run the test, confirm it fails for the right reason (not a typo)
3. **GREEN** — Write minimal code to make the test pass
4. **Verify GREEN** — Run the test, confirm it passes along with all existing tests
5. **REFACTOR** — Clean up if needed, keeping tests green

**Why:** A test written after implementation passes immediately and proves nothing. Test-first forces you to see the failure, proving the test actually catches the bug.

## Path-Scoped Rules

Component-specific rules live in [`.claude/rules/`](.claude/rules/). Claude Code natively auto-loads these files:

- Rules with `paths:` frontmatter load **only** when matching files enter context
- Rules without `paths:` frontmatter load at session start (like CLAUDE.md but topic-scoped)

See [`.claude/rules/README.md`](.claude/rules/README.md) for how to use this mechanism. Use when CLAUDE.md grows beyond ~200 lines or when rules are tightly scoped to one component.

## Git Commit Guidelines

**Stage only files from your current session.** Before committing:

1. Run `git status` to see all modified files
2. Stage only files related to your current task
3. Do NOT include unrelated files from previous sessions

```bash
# Good: stage specific files
git add path/to/changed/file.ext path/to/test.ext

# Avoid: staging everything blindly
git add -A  # Only use for releases or when ALL changes reviewed
```

**Exception:** `release-skill` uses `git add -A` because releases should include all pending changes.

---

# 2. PROJECT CONTEXT

Understand the system before working on it.

## Project Overview

[PROJECT_DESCRIPTION]

## Architecture

- **Services**: [List your services/components]
- **Database**: [Your database technology]
- **Deployment**: [Your deployment target]

## Documentation Policy

**CRITICAL**: Documentation must be kept in sync with code changes at all times.

**Locality principle**: Documentation lives close to the code it documents. Update local docs first, root docs only if needed. Use the `updating-docs` skill for detailed guidance.

**Example Workflow:**
```
User: "Add a new [FEATURE_TYPE] for [FEATURE_PURPOSE]"

Agent:
1. READ: [SERVICE_FOLDER]/[service-name]/README.md (relevant section)
2. READ: [SERVICE_FOLDER]/[service-name]/[component]/README.md (component specs)
3. CODE: Implement the new feature following documented patterns
4. UPDATE: [SERVICE_FOLDER]/[service-name]/[component]/README.md (add new spec)
5. UPDATE: [SERVICE_FOLDER]/[service-name]/README.md (mention if needed)
6. UPDATE: Root README.md only if affects user-facing features
```

### Documentation Locality Principle

**Documentation should live close to the code it documents.** Follow the principle of locality:

- **Service changes** → Update the service's own README (e.g., `[SERVICE_FOLDER]/[service-name]/README.md`)
- **Infrastructure changes** → Update infrastructure docs (e.g., `[INFRASTRUCTURE_FOLDER]/README.md`)
- **Deployment changes** → Update deployment docs (e.g., `[DEPLOYMENT_FOLDER]/README.md`)
- **Cross-cutting changes** → Update root README.md and CLAUDE.md

**Do NOT** duplicate detailed documentation in multiple places. Instead:
- Keep **detailed docs** local to the component
- Keep **high-level overview** in root README.md
- Use **links** to connect them

### Documentation Reference Guide

**Before you start coding, read the relevant documentation:**

| Task | Read First | Update After |
|------|-----------|-------------|
| **Modify service** | `[SERVICE_FOLDER]/[service]/README.md` | Same file |
| **Add component** | Service README + component README | Both files |
| **Change infrastructure** | `[INFRASTRUCTURE_FOLDER]/README.md` | Same file + CLAUDE.md if workflow changes |
| **Modify deployment** | `[DEPLOYMENT_FOLDER]/README.md` | Same file + CLAUDE.md if workflow changes |
| **Add/modify tests** | Service test README | Same file |
| **Change config schema** | Relevant service README | Same file + config examples |
| **Plan complex feature** | [`_tasks/CLAUDE.md`](_tasks/CLAUDE.md) | Create `_tasks/{NN}-{name}/` folder |

**Remember**: Always read BEFORE coding, update AFTER coding!

### Documentation Structure and Hierarchy

```
Project Root
├── README.md                                    # High-level overview, architecture, setup
├── CLAUDE.md                                    # Development conventions (this file)
├── DECISIONS.md                                 # Architecture and business logic decisions
├── CHANGELOG.md                                 # Version history (Keep a Changelog format)
│
├── .claude/                                     # Claude Code configuration
│   ├── settings.json                            # Permissions + hooks configuration
│   ├── hooks/                                   # Automation scripts (e.g., post-commit reminder)
│   ├── rules/                                   # Path-scoped context rules (native feature)
│   └── skills/                                  # Invokable skills (workflows + commands)
│
├── [SERVICE_FOLDER]/
│   └── [service-name]/                          # Service (owns its docs)
│       ├── README.md                            # Complete service documentation
│       └── tests/README.md                      # Service testing docs
│
├── [INFRASTRUCTURE_FOLDER]/                     # Infrastructure (owns its docs)
│   └── README.md
│
├── [DEPLOYMENT_FOLDER]/                         # Deployment (owns its docs)
│   └── README.md
│
└── _tasks/                                      # Task planning folder
    ├── TASK-STATUS-INDEX.md                     # Central task dashboard
    ├── CLAUDE.md                                # Task conventions
    ├── {NN}-{task-name}/                        # Active task folders
    ├── _done/                                   # Archived completed tasks
    └── _TECH_DEBT/                              # Technical debt tracking
        └── _done/                               # Archived fixed tech debt
```

**Key Principle**: Each component/service/directory owns and maintains its own documentation.

### Documentation Quality Standards

1. **Accuracy**: Documentation must accurately reflect the current state of the system
2. **Completeness**: Include all necessary information for someone new to understand and use the feature
3. **Examples**: Provide concrete examples and code snippets
4. **Links**: Use markdown links for cross-references; keep links up-to-date
5. **File References**: Use clickable markdown links to files/lines (e.g., `[filename.ts:42](path/to/file.ts#L42)`)
6. **Consistency**: Follow the existing documentation style and structure
7. **Context**: Explain the "why" not just the "what"

---

# 3. WORKFLOWS

How to perform common tasks.

## Task Planning Folder (`_tasks/`)

Complex features and multi-session work go in `_tasks/`. See [`_tasks/CLAUDE.md`](_tasks/CLAUDE.md) for detailed conventions (folder structure, file naming, lifecycle, `_done/` archival).

The central dashboard for task status is [`_tasks/TASK-STATUS-INDEX.md`](_tasks/TASK-STATUS-INDEX.md). New tasks get registered there by `task-plan-skill`; completed tasks get archived to `_done/` via `move-to-done-skill`.

See [`_tasks/00-example/`](_tasks/00-example/) for a sample task folder showing the pattern.

## Decisions Log (`DECISIONS.md`)

Record architectural (ADR) and business logic (BIZ) decisions in [`DECISIONS.md`](DECISIONS.md).

**When to record decisions:**
- Choosing between frameworks/libraries
- Defining business rules or calculations
- Making architectural trade-offs
- Establishing coding patterns
- Resolving technical debates

**Key principle:** Focus on the "why" - reasoning is the most valuable part of a decision record.

Invoke `decision-skill` to record a new entry.

## Changelog (`CHANGELOG.md`)

Update [`CHANGELOG.md`](CHANGELOG.md) **immediately** after completing work. Don't batch changes or wait until release.

**Workflow:**
1. Complete feature/fix
2. Add entry under `[Unreleased]` in the appropriate category (Added, Changed, Fixed, Removed)
3. Commit changelog update with the code changes

A post-commit hook ([`.claude/hooks/post-commit-reminder.sh`](.claude/hooks/post-commit-reminder.sh)) reminds the agent to invoke `changelog-skill` after every git commit that doesn't already touch CHANGELOG.

**Writing tips:**
- Be concise (one line per change)
- Focus on user-visible impact, not implementation details
- Use consistent terminology

Invoke `changelog-skill` to add an entry.

## Skills

This template includes Claude Code skills for common workflows. Invoke by name (e.g., `changelog-skill`) or let natural-language requests trigger auto-activation via their descriptions.

| Skill | Purpose |
|-------|---------|
| `task-plan-skill` | Plan a new feature with brainstorming + structured folders |
| `decision-skill` | Record an architectural or business decision |
| `changelog-skill` | Update changelog after completing work |
| `verify-skill` | Run verification checks before marking work complete |
| `release-skill` | Bump version, update changelog, commit, tag, push |
| `move-to-done-skill` | Verify a completed task and archive it to `_done/` |
| `updating-docs-skill` | Which docs to update after code changes (locality principle) |
| `code-review-skill` | Iterative code review (max 4 iterations, 2-phase approval) |
| `plan-review-skill` | Review plans/designs before implementation |
| `test-review-skill` | Review test coverage for gaps |
| `upstream-sync-skill` | Learn from a descendant project and sync refinements back |

Skills live in `.claude/skills/`.

### Superpowers Integration

**For projects using [Superpowers](https://github.com/codequalitypro/superpowers-marketplace):** The template skills are orchestration layers that work WITH Superpowers, not replacements:

- `task-plan-skill` → Uses `superpowers:brainstorming` + `writing-plans`, adds structured `_tasks/` folders
- `verify-skill` → Recommends `superpowers:verification-before-completion`, adds changelog/git checks
- `code-review-skill` → Uses `superpowers:code-reviewer`, adds 2-phase iterative workflow with approval gate
- `plan-review-skill` / `test-review-skill` → Standalone iterative review workflows with documentation artifacts
- `updating-docs-skill` / `move-to-done-skill` → Project-specific lifecycle skills with no direct Superpowers equivalent

**Copy all skills.** They complement Superpowers by adding project-specific structure and iterative quality gates.

## Task Completion Checklist

Before marking any task complete:

- [ ] Tests pass? (run your test command)
- [ ] Code committed with descriptive message?
- [ ] `changelog-skill` run to update [Unreleased]?
- [ ] Changelog committed?
- [ ] Local docs updated? (use `updating-docs-skill` if unsure which)

For significant decisions made during task:
- [ ] `decision-skill` run to record ADR/BIZ entry?

For completed tasks in `_tasks/{NN}-name/`:
- [ ] `move-to-done-skill` run to archive to `_done/` and update `TASK-STATUS-INDEX.md`?

---

# 4. ENVIRONMENT & TOOLING

Consult these sections when relevant to your current task.

## File Encoding Standards

**CRITICAL**: All files should use consistent line endings.

- **Line Endings**: Use LF (`\n`) for cross-platform compatibility
- **Enforcement**: Configure `.gitattributes` with `* text eol=lf` to enforce LF globally
- **Automatic Conversion**: Git automatically converts line endings on checkout

This is especially critical for:
- Shell scripts (`*.sh`)
- Python files (`*.py`)
- Dockerfiles
- Any file executed in containers

## OS-Specific Notes

[Add any OS-specific development notes here, e.g., Windows Git Bash path conversion, WSL gotchas, PowerShell quirks. Remove this section if not applicable.]

---

# 5. TECHNICAL REFERENCE

Look up these sections as needed when working with specific services or infrastructure.

## Common Development Commands

```bash
# Start development server
[YOUR_COMMAND_HERE]

# Run tests
[YOUR_COMMAND_HERE]

# Build for production
[YOUR_COMMAND_HERE]
```

## Environment Variables

- `[VAR_NAME]`: Description of what this variable controls

## Code Conventions

- Convention 1
- Convention 2
- Convention 3
