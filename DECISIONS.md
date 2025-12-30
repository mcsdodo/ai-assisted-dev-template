# Decisions Log

This file records architectural (ADR) and business logic (BIZ) decisions for the project.

**Format:** Newest decisions first. Each entry includes context, decision, and reasoning.

---

## Decisions

### 2025-01-01

#### ADR-001: Example - Template file structure

**Context:** This is an example entry showing the decision format.

**Decision:** Use Context → Decision → Reasoning format for all decisions.

**Reasoning:** This format captures the essential "why" that makes decision records valuable for future reference.

---

#### BIZ-001: Example - Session timeout duration

**Context:** Need to define how long user sessions remain valid before requiring re-authentication.

**Decision:** Sessions expire after 7 days of inactivity. Active sessions extend automatically.

**Reasoning:** 7 days balances security (not too long) with usability (users don't need to log in daily). Auto-extension means active users never get interrupted.

**Options Considered:**
- 24 hours: Too aggressive for a productivity app
- 30 days: Security concern for shared/public devices
- No expiry: Unacceptable security risk
