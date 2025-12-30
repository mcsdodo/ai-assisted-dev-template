# Setup and Customization

Before using the commands and skills in this template, customize them for your project.

## Quick Setup Checklist

- [ ] Customize `/release` command for your version files
- [ ] Replace `[PLACEHOLDER]` values in `CLAUDE.md`
- [ ] Verify `_tasks/` folder exists
- [ ] Delete or keep `_tasks/00-example/` as reference

## Release Skill Customization

The `/release` command needs to know where your version files are.

### Step 1: Identify Your Version Files

**Node.js projects:**
```
package.json
package-lock.json (optional)
```

**Python projects:**
```
pyproject.toml
setup.py (if used)
```

**Rust projects:**
```
Cargo.toml
Cargo.lock
```

**Other:**
- Any file containing a version string that needs updating

### Step 2: Edit the Release Skill

Open `.claude/skills/release-skill/SKILL.md` and update:

1. **Step 1 (Check Current Version):**
   Replace example commands with your actual version check command.

2. **Step 3 (Update Version Files):**
   Replace `[VERSION_FILE_1]` and `[VERSION_FILE_2]` with your actual files:
   ```markdown
   - `package.json`
   - `package-lock.json`
   ```

3. **Step 5 (Verify Build):**
   Replace `[BUILD_COMMAND]` and `[TEST_COMMAND]`:
   ```markdown
   ```bash
   npm run build
   npm test
   ```
   ```

### Example: Node.js Project

```markdown
### Step 1: Check Current Version
```bash
cat package.json | grep '"version"'
```

### Step 3: Update Version Files
- `package.json`
- `package-lock.json`

### Step 5: Verify Build
```bash
npm run build && npm test
```
```

### Example: Python Project

```markdown
### Step 1: Check Current Version
```bash
cat pyproject.toml | grep '^version'
```

### Step 3: Update Version Files
- `pyproject.toml`

### Step 5: Verify Build
```bash
python -m build && pytest
```
```

## CLAUDE.md Customization

Search for `[PLACEHOLDER]` in the root `CLAUDE.md` and replace:

| Placeholder | Replace With | Example |
|-------------|--------------|---------|
| `[PROJECT_NAME]` | Your project name | "My Awesome App" |
| `[PROJECT_DESCRIPTION]` | Brief description | "A CLI tool for..." |
| `[SERVICE_FOLDER]` | Services folder | "src/services" or "apps" |
| `[INFRASTRUCTURE_FOLDER]` | Infra folder | "terraform" or "infra" |
| `[DEPLOYMENT_FOLDER]` | Deploy scripts | "deploy" or "scripts" |

## Folder Structure

Ensure these folders exist:

```
your-project/
├── _tasks/                    # Task planning (required)
│   └── _TECH_DEBT/           # Tech debt tracking
├── .claude/
│   ├── commands/             # Slash commands
│   └── skills/               # Skill implementations
├── CLAUDE.md                 # AI guidance
├── DECISIONS.md              # Decision log
└── CHANGELOG.md              # Version history
```

## Verification

After setup, verify everything works:

1. **Test /changelog:** Make a small change and run `/changelog`
2. **Test /decision:** Record a test decision, then delete it
3. **Test /task-plan:** Create a test task folder, then delete it
4. **Test /release:** Do a dry run (skip the push step)

## Next Steps

- Read [../CLAUDE.md](../CLAUDE.md) for documentation conventions
- Delete `_tasks/00-example/` when you're comfortable with the structure
