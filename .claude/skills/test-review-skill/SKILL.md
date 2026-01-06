---
name: test-review-skill
description: Use to review test coverage for completeness and quality
---

# Iterative Test Review

Review test coverage for completeness, edge cases, and quality.

## When to Apply

- After implementing a feature
- Before release
- When adding tests to existing code
- Periodic test health checks

## Requirements

Before starting:
1. **Target**: Code module/file to analyze
2. **Reference**: (Optional) Business rules or requirements

## Quality Gate

Exit when: **2 consecutive iterations with no new issues** (convergence)

## Review Focus Areas

| Area | Questions |
|------|-----------|
| **Coverage** | All functions tested? All branches covered? |
| **Edge Cases** | Boundary conditions? Empty inputs? Error paths? |
| **Quality** | Tests verify real logic (not just mocks)? Independent? Meaningful assertions? |
| **Business Logic** | Business rules validated? Calculations verified? |

## Severity Levels

| Level | Description | Action |
|-------|-------------|--------|
| **Critical** | Untested critical path, missing error handling tests | Must add |
| **Important** | Missing edge cases, weak assertions | Should add |
| **Minor** | Could improve test names, minor gaps | Note for later |

## Workflow

### Step 1: Locate Test Files

```bash
# Find tests for the target module
# Adjust pattern for your project structure
find . -name "*test*" -o -name "*spec*" | grep -i [module_name]
```

### Step 2: Create Progress File

Create `_test-review.md`:

```markdown
# Test Review Progress

**Target:** [code module path]
**Reference:** [business rules, if any]

## Iteration 1
- [ ] Review complete
- Findings: ...
- Tests added: ...
```

### Step 3: Iterative Review Loop (Max 4)

For each iteration:

1. **Analyze coverage**: Map functions to tests

2. **Identify gaps**: Missing tests, edge cases, error paths

3. **Evaluate quality**: Real logic tested? Independent? Meaningful?

4. **Add/improve tests** for Critical/Important findings

5. **Run tests**: `[TEST_COMMAND]`

6. **Update progress file**

7. **Check convergence**:
   - 2 iterations with no new issues? → Done
   - New issues found? → Continue (if < 4)

### Step 4: Final Assessment

Document:
- Coverage summary
- Tests added
- Remaining gaps (if any)
- Test health assessment

## Domain Checklist

- [ ] Critical business logic has tests?
- [ ] Edge cases covered (empty, null, boundary)?
- [ ] Error scenarios tested?
- [ ] Tests are independent (no order dependency)?
- [ ] Assertions are meaningful (not just "no error")?
- [ ] No mock-only tests (testing real behavior)?

## Example Usage

```
Target: src/calculations.ts
Reference: docs/business-rules.md

Iteration 1:
  Findings: [Critical] No tests for negative inputs, [Important] Missing boundary test
  Tests added: testNegativeInput(), testBoundaryValues()

Iteration 2:
  Findings: [Minor] Could add performance test
  Convergence: No new Critical/Important

Assessment: Coverage adequate for release
```

## Related Skills

- **code-review-skill** - Review implementation alongside tests
- **verify-skill** - Quick pre-completion verification
