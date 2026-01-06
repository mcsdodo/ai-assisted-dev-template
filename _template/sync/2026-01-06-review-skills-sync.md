# Sync Analysis: 2026-01-06 (Review Skills Update)

**Date:** 2026-01-06
**Baseline (this template):** 2026-01-06 18:31:05 +0100
**Upstream commits analyzed:** 1 commit + skill content comparison

---

## Executive Summary

Upstream evolved the review skills to a **two-phase approach** with explicit user approval gates. Key changes:

1. **Phase separation**: "Findings only" → User approval → "Apply fixes"
2. **Quality gate changed**: "No new findings for 1 iteration" instead of severity-based exit
3. **Explicit STOP points**: Clear handoff to user between phases
4. **Removed shared template**: `_templates/review-base.md` deleted - skills are now standalone

---

## Detailed Comparison

### Review Skills Structure

| Aspect | Template (Current) | Upstream (New) |
|--------|-------------------|----------------|
| **Phases** | Single pass | Two phases with user approval |
| **User Gate** | Implicit | Explicit "STOP and wait for user direction" |
| **Quality Gate** | Severity-based (Critical/Important) | Convergence-based (no new findings) |
| **Progress File** | Brief structure | Detailed with iterations, checkboxes, status |
| **Commit Pattern** | Not specified | Commit after each phase |
| **Shared Template** | None | Removed (was `_templates/review-base.md`) |

### Upstream Quality Gates

| Skill | Quality Gate |
|-------|-------------|
| code-review-skill | No new findings for 1 iteration (review comprehensive) |
| plan-review-skill | No new findings for 1 iteration (review comprehensive) |
| test-review-skill | No new gaps found for 1 iteration (review comprehensive) |

### Upstream Phase Structure

```
Phase 1: Review (Findings Only)
├── Step 1: Gather context / Run tests
├── Step 2: Create review document
├── Step 3: Execute review loop (max 4 iterations)
├── Step 4: Finalize review document
└── Step 5: Present for user approval → STOP

Phase 2: Apply Approved Fixes (only after user approval)
├── Step 6/7: Apply approved fixes
├── Step 8: Run tests / Commit
└── Step 9/10: Final assessment
```

---

## Key Insights

### Why Two Phases?

The two-phase approach addresses a real problem:
- Prevents AI from "fixing" things user didn't want fixed
- Gives user control over which findings to address vs skip
- Creates explicit review artifacts that persist
- Separates "analysis" from "action"

### Why Convergence-Based Quality Gate?

The shift from "no Critical/Important issues" to "no new findings":
- More objective (either new issues or not)
- Prevents premature exit when review isn't comprehensive
- Aligns with idea of "thorough review" vs "just pass severity threshold"

### Why Remove Shared Template?

The `review-base.md` template was removed because:
- Each skill had enough unique content
- DRY at the cost of readability/maintainability wasn't worth it
- Easier to customize individual skills

---

## Recommendations

### Option A: Full Update (Recommended)

Update all three review skills to match upstream's two-phase pattern:

**Pros:**
- Matches battle-tested upstream approach
- Better user control over fixes
- Clearer workflow with explicit gates

**Cons:**
- More verbose skills
- May be overkill for simple projects

### Option B: Hybrid Approach

Keep single-phase but add optional user gate:
- Default: Apply fixes automatically
- Optional: Add "STOP for approval" flag

**Pros:**
- Simpler for quick reviews
- Flexibility

**Cons:**
- Diverges from upstream learnings

### Option C: No Change

Keep current structure, note upstream evolution in sync docs.

**Pros:**
- No work required
- Current skills already functional

**Cons:**
- Misses upstream learnings about user control

---

## Implementation Plan (if Option A selected)

### Files to Update

| File | Changes |
|------|---------|
| `.claude/skills/code-review-skill/SKILL.md` | Add two-phase structure, update quality gate |
| `.claude/skills/plan-review-skill/SKILL.md` | Add two-phase structure, update quality gate |
| `.claude/skills/test-review-skill/SKILL.md` | Add two-phase structure, update quality gate |

### Key Changes Per Skill

1. Add "Preset Configuration" block at top
2. Split into Phase 1 (Findings) and Phase 2 (Apply)
3. Add explicit "STOP and wait for user direction" after Phase 1
4. Update quality gate to convergence-based
5. Add detailed review document structure with checkboxes
6. Add commit patterns for each phase
7. Keep `[TEST_COMMAND]` and `[PLACEHOLDER]` markers (vs upstream's specific commands)

---

## Validation Against 80/20

| Change | Enforces Quality? | Worth Adding? |
|--------|-------------------|---------------|
| Two-phase with user gate | Yes - prevents unwanted changes | Yes |
| Convergence quality gate | Somewhat - more objective | Yes |
| Detailed progress structure | Somewhat - better tracking | Yes |
| Commit per iteration | Maybe - overhead | Optional |

---

## Questions for User

1. Which option? (A: Full Update, B: Hybrid, C: No Change)
2. Include commit-per-iteration pattern or simplify?
3. Any project-specific customizations needed?
