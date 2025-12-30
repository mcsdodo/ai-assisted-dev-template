---
name: decision-skill
description: Use when making architectural or business logic decisions that should be documented
---

# Decision Documentation Skill

This skill ensures important decisions are recorded with their rationale.

## When to Apply

- Choosing between frameworks/libraries
- Defining business rules or calculations
- Making architectural trade-offs
- Establishing coding patterns
- Resolving technical debates
- Any decision a future developer might question

## Decision Types

### ADR (Architecture Decision Record)
- Framework and library choices
- Design patterns
- Code organization
- API design
- Infrastructure decisions

### BIZ (Business Logic Decision)
- Calculations and formulas
- Validation rules
- Behavioral requirements
- Business constraints
- Domain-specific logic

## Workflow

### Step 1: Identify Decision Type

Ask: "Is this about technical architecture or business rules?"
- Technical → ADR
- Business rules → BIZ

### Step 2: Find Next Number

Check `DECISIONS.md` for the highest existing number of this type:
- If highest ADR is `ADR-005`, use `ADR-006`
- If highest BIZ is `BIZ-003`, use `BIZ-004`

### Step 3: Write Decision Entry

Add at the TOP of the Decisions section (newest first):

```markdown
### YYYY-MM-DD

#### [ADR|BIZ]-NNN: [Descriptive Title]

**Context:** [Why this decision was needed. What problem or question arose?]

**Decision:** [What was decided. Be specific and actionable.]

**Reasoning:** [Why this approach was chosen over alternatives. This is the most valuable part.]

**Options Considered:** [Optional - list alternatives that were evaluated]
- Option A: [Description] - [Why not chosen]
- Option B: [Description] - [Why not chosen]
```

### Step 4: Commit

```bash
git add DECISIONS.md
git commit -m "docs: record [ADR|BIZ]-NNN [short description]"
```

## Key Principle

**The "why" matters most.**

Reasoning should explain the thinking behind choices. Future developers should be able to understand:
- What prompted the decision
- What was chosen
- Why it was the best option

This prevents "archaeology" - digging through code history to understand choices.

## Examples

### Good Decision Entry

```markdown
### 2025-01-15

#### ADR-008: Move all calculations to backend

**Context:** Frontend was duplicating calculation logic from backend, causing inconsistencies and maintenance burden.

**Decision:** All business calculations will live exclusively in the Rust backend. Frontend only displays pre-calculated values.

**Reasoning:** Single source of truth eliminates sync issues. Backend can be tested thoroughly. Frontend remains a thin display layer.

**Options Considered:**
- Keep calculations in both: Rejected due to drift risk
- Move to shared library: Added complexity without clear benefit
```

### Linking to Tech Debt

If a decision creates technical debt, reference it:
```markdown
**Related:** Creates `_TECH_DEBT/05-frontend-calculation-removal.md`
```

## Related Skills

- **task-plan-skill** - Decisions often emerge during feature planning
- **changelog-skill** - Significant decisions may warrant changelog entries
