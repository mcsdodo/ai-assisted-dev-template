# Contributing to [PROJECT_NAME]

Thank you for your interest in contributing! This guide will help you get started.

> **Note:** This is an opinionated contribution guide emphasizing Test-Driven Development, Conventional Commits, and internationalization patterns. Adjust or remove sections that don't fit your project's workflow.

## Prerequisites

<!-- CUSTOMIZE: List your project's prerequisites -->

- [Language/Runtime] version X.X+
- [Package Manager]
- [Other tools]

## Development Setup

1. Clone the repository:
   ```bash
   git clone [REPOSITORY_URL]
   cd [PROJECT_NAME]
   ```

2. Install dependencies:
   ```bash
   [INSTALL_COMMAND]
   ```

3. Start development environment:
   ```bash
   [DEV_COMMAND]
   ```

4. Run tests:
   ```bash
   [TEST_COMMAND]
   ```

## Development Workflow

This project follows **Test-Driven Development (TDD)**:

```
1. Write a failing test first
2. Implement minimal code to pass the test
3. Refactor while maintaining test passage
4. Repeat
```

### What to Test

Focus testing efforts on:
- Business logic and calculations
- Validation rules
- Edge cases and error handling
- Integration points

Avoid testing:
- Trivial getters/setters
- Framework-provided functionality
- Pure UI rendering (unless complex)

## Code Organization

<!-- CUSTOMIZE: Describe your project structure -->

```
[PROJECT_NAME]/
├── src/                    # Source code
│   ├── [components]/       # [Description]
│   └── [services]/         # [Description]
├── tests/                  # Test files
└── docs/                   # Documentation
```

## Internationalization (i18n)

<!-- CUSTOMIZE: Remove if not applicable -->

If your project supports multiple languages:

1. **Code language**: All code, comments, and commit messages in English
2. **User-facing text**: Must go through i18n system
3. **Adding translations**:
   - Add keys to `[I18N_FILE_PATH]`
   - Provide translations for all supported locales
4. **Supported locales**: [List locales, e.g., en, sk, de]

## Contribution Process

1. **Check existing issues**: Look for related issues or discussions
2. **Create a branch**: Use descriptive names (`feature/add-auth`, `fix/login-bug`)
3. **Write tests**: Follow TDD - tests before implementation
4. **Implement changes**: Follow existing code patterns
5. **Update documentation**: Keep docs in sync with code
6. **Submit PR**: Fill out the PR template completely

## Pull Request Guidelines

### Before Submitting

- [ ] Tests pass locally
- [ ] Code follows project conventions
- [ ] Documentation updated (if applicable)
- [ ] CHANGELOG.md updated with your changes
- [ ] Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/)

### Commit Message Format

```
type(scope): description

[optional body]

[optional footer]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Examples:
- `feat(auth): add OAuth2 login support`
- `fix(api): handle timeout errors gracefully`
- `docs: update installation instructions`

### PR Description

Include:
- What changed and why
- How to test the changes
- Screenshots (for UI changes)
- Related issues

## Code Review

All PRs require review before merging. Reviewers will check:
- Correctness and completeness
- Test coverage
- Code style and conventions
- Documentation accuracy

## Questions?

- Open a [GitHub Discussion](../../discussions) for questions
- Check existing issues for solutions
- Read the project documentation

---

Thank you for contributing!
