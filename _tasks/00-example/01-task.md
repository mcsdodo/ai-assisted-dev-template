# Example Task File

**Date:** 2025-01-15
**Subject:** User authentication feature
**Status:** Complete (example)

---

This is an example task file showing the recommended structure. Delete this folder when starting your own project, or keep it as a reference.

---

## Goal

Add user authentication to the application, allowing users to log in, log out, and maintain sessions.

## Requirements

- Users can register with email and password
- Users can log in with credentials
- Sessions persist across browser refreshes
- Users can log out and end their session
- Protected routes redirect unauthenticated users to login

## Technical Considerations

From brainstorming session:

- **Authentication method**: JWT tokens stored in httpOnly cookies
- **Password hashing**: bcrypt with cost factor 12
- **Session duration**: 7 days with refresh token rotation
- **Rate limiting**: 5 failed login attempts triggers 15-minute lockout

## Edge Cases

- Expired tokens should redirect to login gracefully
- Multiple devices should maintain independent sessions
- Password reset flow needed (separate task)

## Out of Scope

- Social login (OAuth) - future enhancement
- Two-factor authentication - future enhancement
- Password reset - separate task

## Related

- Creates tech debt: `_TECH_DEBT/01-session-cleanup-job.md` (cleanup expired sessions)
