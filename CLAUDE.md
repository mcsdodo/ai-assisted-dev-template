# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

> **For agents setting up from template:** `[PLACEHOLDER]` markers indicate values to adapt based on the target project's structure. Analyze the project and replace with appropriate values.

## Core Principle: Documentation-Driven Development

**MANDATORY WORKFLOW FOR ALL CODE CHANGES:**

```
1. READ documentation FIRST (understand patterns/architecture)
2. WRITE code (following documented conventions)
3. UPDATE documentation (reflect your changes)
```

**Never skip step 1 or 3!** Documentation must always be read before coding and updated after coding.

---

## Project Overview

[PROJECT_DESCRIPTION]

## Documentation Policy

**CRITICAL**: Documentation must be kept in sync with code changes at all times.

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

**Example**: If you modify a service's CLI commands:
1. **First**: Update `[SERVICE_FOLDER]/[service-name]/README.md` (local documentation)
2. **Then**: Update root `README.md` only if it affects overall usage
3. **Finally**: Update `CLAUDE.md` only if it affects development conventions

**Do NOT** duplicate detailed documentation in multiple places. Instead:
- Keep **detailed docs** local to the component
- Keep **high-level overview** in root README.md
- Use **links** to connect them

### When to Update Documentation

**You MUST update documentation whenever you change code.** Apply the locality principle:

| Change Type | Update First (Local) | Update Second (Root) |
|-------------|---------------------|---------------------|
| Service/Component | Service's own README | Root README if architecture changes |
| Infrastructure | `[INFRASTRUCTURE_FOLDER]/README.md` | CLAUDE.md if workflow changes |
| Deployment | `[DEPLOYMENT_FOLDER]/README.md` | CLAUDE.md if workflow changes |
| Testing | Service test docs | Service README if strategy changes |
| Configuration | Config-specific docs | Root docs if affects setup |
| Cross-Cutting | Root docs directly | - |

**Exception for CLAUDE.md**: Also update if changes affect agent workflows (new CLI commands, debugging patterns, common operations).

### Documentation Structure and Hierarchy

**Documentation is organized hierarchically by locality:**

```
Project Root
├── README.md                                    # High-level overview, architecture, setup
├── CLAUDE.md                                    # Development conventions, deployment workflow
├── DECISIONS.md                                 # Architecture and business logic decisions
├── CHANGELOG.md                                 # Version history (Keep a Changelog format)
│
├── .claude/                                     # Claude Code configuration
│   ├── commands/                                # Slash commands (/task-plan, /decision, etc.)
│   │   ├── task-plan.md
│   │   ├── decision.md
│   │   ├── changelog.md
│   │   └── release.md
│   └── skills/                                  # Skills supporting commands
│       ├── task-plan-skill/SKILL.md
│       ├── decision-skill/SKILL.md
│       ├── changelog-skill/SKILL.md
│       └── release-skill/SKILL.md
│
├── [SERVICE_FOLDER]/
│   ├── [service-name]/                          # Service (owns its docs)
│   │   ├── README.md                            # Complete service documentation
│   │   ├── tests/
│   │   │   └── README.md                        # Service testing docs
│   │   └── [components]/
│   │       └── README.md                        # Component specifications
│   │
│   └── [another-service]/                       # Another service (owns its docs)
│       └── README.md                            # Service docs
│
├── [INFRASTRUCTURE_FOLDER]/                     # Infrastructure (owns its docs)
│   └── README.md                                # Infrastructure deployment guide
│
├── [DEPLOYMENT_FOLDER]/                         # Deployment (owns its docs)
│   └── README.md                                # Build and deployment scripts
│
├── _tasks/                                      # Task planning folder (AI assistant)
│   ├── 00-example/                              # Example task folder (delete or keep as reference)
│   ├── {NN}-{task-name}/                        # Individual task folders
│   │   ├── 01-task.md                           # Task description and requirements
│   │   ├── 02-plan.md                           # Implementation plan
│   │   └── 03-*.md                              # Additional docs (design, notes, etc.)
│   └── _TECH_DEBT/                              # Technical debt tracking
│
└── .env.example                                 # Environment variables template
```

**Key Principle**: Each component/service/directory owns and maintains its own documentation.

### Documentation Reference Guide for Common Tasks

**Before you start coding, read the relevant documentation:**

| Task | Read These Docs First | Update After Coding |
|------|----------------------|---------------------|
| **Modify service** | `[SERVICE_FOLDER]/[service]/README.md` | Same file |
| **Add component** | Service README + component README | Both files |
| **Change infrastructure** | `[INFRASTRUCTURE_FOLDER]/README.md` | Same file + CLAUDE.md if workflow changes |
| **Modify deployment** | `[DEPLOYMENT_FOLDER]/README.md` | Same file + CLAUDE.md if workflow changes |
| **Add/modify tests** | Service test README | Same file |
| **Change config schema** | Relevant service README | Same file + config examples |
| **Plan complex feature** | `_tasks/CLAUDE.md` | Create `_tasks/{NN}-{name}/` folder |

**Remember**: Always read BEFORE coding, update AFTER coding!

### Documentation Quality Standards

1. **Accuracy**: Documentation must accurately reflect the current state of the system
2. **Completeness**: Include all necessary information for someone new to understand and use the feature
3. **Examples**: Provide concrete examples and code snippets
4. **Links**: Use markdown links for cross-references; keep links up-to-date
5. **File References**: Use clickable markdown links to files/lines (e.g., `[filename.ts:42](path/to/file.ts#L42)`)
6. **Consistency**: Follow the existing documentation style and structure
7. **Context**: Explain the "why" not just the "what"

### Documentation Update Checklist

When implementing a change, follow the **locality principle** and use this checklist:

**Step 1: Update Local Documentation (where the change was made)**
- [ ] Updated service-specific README if service code changed
- [ ] Updated infrastructure docs if infrastructure changed
- [ ] Updated deployment docs if deployment scripts changed
- [ ] Updated test docs if tests changed
- [ ] Updated configuration examples if config schema changed
- [ ] Added/updated code examples and CLI usage in local docs

**Step 2: Update Root Documentation (only if needed)**
- [ ] Updated root `README.md` ONLY if:
  - Architecture overview changed
  - User-facing setup/usage changed
  - New service added/removed
- [ ] Updated root `CLAUDE.md` ONLY if:
  - Development conventions changed
  - Deployment workflow changed

**Step 3: Verify Documentation Quality**
- [ ] Verified all markdown links are valid and point to existing files
- [ ] Ensured no duplication between local and root docs (use links instead)
- [ ] Confirmed examples are accurate and tested

**Remember: Local First, Root Second!**

## Task Planning Folder (`_tasks/`)

Complex features and multi-session work go in `_tasks/`. See [`_tasks/CLAUDE.md`](_tasks/CLAUDE.md) for detailed conventions (folder structure, file naming, lifecycle).

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

Use `/decision` command or invoke the decision skill.

## Changelog (`CHANGELOG.md`)

Update [`CHANGELOG.md`](CHANGELOG.md) **immediately** after completing work. Don't batch changes or wait until release.

**Workflow:**
1. Complete feature/fix
2. Add entry under `[Unreleased]` in the appropriate category (Added, Changed, Fixed, Removed)
3. Commit changelog update with the code changes

**Writing tips:**
- Be concise (one line per change)
- Focus on user-visible impact, not implementation details
- Use consistent terminology

Use `/changelog` command or invoke the changelog skill.

## Slash Commands

This template includes Claude Code slash commands for common workflows:

| Command | Purpose |
|---------|---------|
| `/task-plan` | Plan a new feature with brainstorming |
| `/decision` | Record an architectural or business decision |
| `/changelog` | Update changelog after completing work |
| `/verify` | Run verification checks before marking work complete |
| `/release` | Create a new version release |

Commands are defined in `.claude/commands/` with supporting skills in `.claude/skills/`.

## Task Completion Checklist

Before marking any task complete:

- [ ] Tests pass? (run your test command)
- [ ] Code committed with descriptive message?
- [ ] `/changelog` run to update [Unreleased]?
- [ ] Changelog committed?

For significant decisions made during task:
- [ ] `/decision` run to record ADR/BIZ entry?

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

**Exception:** `/release` uses `git add -A` because releases should include all pending changes.

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

## Architecture

- **Services**: [List your services/components]
- **Database**: [Your database technology]
- **Deployment**: [Your deployment target]

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
