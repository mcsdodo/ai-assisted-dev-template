# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

<!-- CUSTOMIZE: Add 2-3 sentences describing your project, its purpose, and key technologies -->

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

**You MUST update documentation whenever you make ANY of the following changes:**

1. **Service/Component Changes**
   - **Local First**: Update the service's own README
   - **Root Second**: Update root `README.md` only if it affects architecture overview or usage
   - **Optionally**: Update `CLAUDE.md` if changes affect agent workflows (e.g., new CLI commands, debugging patterns, common operations)

2. **Infrastructure Changes**
   - **Local First**: Update `[INFRASTRUCTURE_FOLDER]/README.md` for infrastructure-specific changes
   - **Root Second**: Update root `CLAUDE.md` only if deployment workflow changes

3. **Deployment Changes**
   - **Local First**: Update `[DEPLOYMENT_FOLDER]/README.md` for deployment script changes
   - **Root Second**: Update `CLAUDE.md` if overall deployment workflow changes

4. **Testing Changes**
   - **Local First**: Update service-specific test docs
   - **Root Second**: Update service README only if test strategy changes

5. **Configuration Changes**
   - **Local First**: Update config-specific docs near the config files
   - **Root Second**: Update root docs only if it affects setup/usage

6. **Cross-Cutting/Architecture Changes**
   - **Update root docs** when changes affect multiple services or overall architecture

### Documentation Structure and Hierarchy

**Documentation is organized hierarchically by locality:**

```
Project Root
├── README.md                                    # High-level overview, architecture, setup
├── CLAUDE.md                                    # Development conventions, deployment workflow
├── DECISIONS.md                                 # Architecture and business logic decisions
├── CHANGELOG.md                                 # Version history (Keep a Changelog format)
├── CONTRIBUTING.md                              # Contribution guidelines
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
| `/release` | Create a new version release |

Commands are defined in `.claude/commands/` with supporting skills in `.claude/skills/`.

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

<!--
================================================================================
CUSTOMIZE: Add project-specific sections below
================================================================================
-->

## Architecture

<!-- CUSTOMIZE: Describe your project architecture -->

- **Services**: [List your services/components]
- **Database**: [Your database technology]
- **Deployment**: [Your deployment target]

## Common Development Commands

<!-- CUSTOMIZE: Add your common commands -->

### [Service Name]
```bash
# Start development server
[YOUR_COMMAND_HERE]

# Run tests
[YOUR_COMMAND_HERE]

# Build for production
[YOUR_COMMAND_HERE]
```

### Docker / Local Development
```bash
# Start all services
[YOUR_COMMAND_HERE]

# View logs
[YOUR_COMMAND_HERE]

# Rebuild after changes
[YOUR_COMMAND_HERE]
```

## Environment Variables

<!-- CUSTOMIZE: List your environment variables -->

- `[VAR_NAME]`: Description of what this variable controls
- `[VAR_NAME]`: Description of what this variable controls

## Code Conventions

<!-- CUSTOMIZE: Add your code conventions -->

### [Language/Framework]
- Convention 1
- Convention 2
- Convention 3

## Important Files

<!-- CUSTOMIZE: List key files in your project -->

- `/path/to/file`: Description of what this file does
- `/path/to/file`: Description of what this file does
