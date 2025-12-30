# Example Implementation Plan

**Date:** 2025-01-15
**Subject:** Implementation plan for user authentication
**Status:** Complete (example)

---

This is an example plan file showing the recommended structure.

---

## Implementation Steps

### Step 1: Database Schema

**Files:**
- `migrations/001_create_users_table.sql` - Create new file
- `src/models/user.ts` - Create new file

**Changes:**
- Create users table with id, email, password_hash, created_at, updated_at
- Create sessions table with id, user_id, token, expires_at
- Add indexes on email (unique) and session token

**Verification:**
- Run migration successfully
- Verify tables exist with correct schema

### Step 2: Authentication Service

**Files:**
- `src/services/auth.ts` - Create new file
- `src/utils/password.ts` - Create new file

**Changes:**
- Implement `hashPassword(plain)` and `verifyPassword(plain, hash)`
- Implement `register(email, password)` returning user or error
- Implement `login(email, password)` returning session token or error
- Implement `logout(token)` invalidating session
- Implement `validateSession(token)` returning user or null

**Verification:**
- Unit tests for password hashing (verify round-trip)
- Unit tests for each auth function
- Test rate limiting on failed logins

### Step 3: API Endpoints

**Files:**
- `src/routes/auth.ts` - Create new file
- `src/middleware/auth.ts` - Create new file

**Changes:**
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login and set cookie
- `POST /api/auth/logout` - Clear session
- `GET /api/auth/me` - Get current user
- Auth middleware that validates session cookie

**Verification:**
- Integration tests for each endpoint
- Test cookie setting/clearing
- Test protected route access

### Step 4: Frontend Integration

**Files:**
- `src/components/LoginForm.tsx` - Create new file
- `src/components/RegisterForm.tsx` - Create new file
- `src/hooks/useAuth.ts` - Create new file
- `src/context/AuthContext.tsx` - Create new file

**Changes:**
- Auth context providing current user and auth methods
- Login form with validation
- Register form with validation
- Protected route wrapper component

**Verification:**
- Can register new account
- Can log in and see protected content
- Can log out and lose access
- Session persists on page refresh

## Verification Checklist

- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] Manual testing of full flow
- [ ] Rate limiting works correctly
- [ ] Sessions expire properly
- [ ] Documentation updated
- [ ] CHANGELOG.md updated
