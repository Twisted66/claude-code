# Agentic Software Engineering Framework

This directory contains the complete configuration for the agentic software engineering framework as described in CLAUDE.md.

## Directory Structure

```
.claude/
├── agents/                 # Specialized subagents
│   ├── backend-developer.md      # Server-side architecture and APIs
│   ├── frontend-developer.md     # UI components and client logic
│   └── security-auditor.md       # Security assessment and compliance
├── commands/              # Custom slash commands
│   ├── init.md                   # Initialize project structure (/init)
│   ├── design-app.md             # UI/UX design phase (/design-app)
│   └── review.md                 # Code review process (/review)
├── hooks/                 # Automation scripts
│   ├── pre-tool-use.sh           # Security and policy enforcement
│   ├── post-tool-use.sh          # Auto-formatting and quality control
│   └── stop.sh                   # Auto-commit and final validation
├── master-prompt.md       # Complete workflow template
└── README.md             # This file
```

## Quick Start

1. **Use the Master Prompt Template**
   ```bash
   # Copy the template from .claude/master-prompt.md
   # Replace <PASTE HIGH-LEVEL PRD HERE> with your requirements
   # Execute the prompt to start the five-phase workflow
   ```

2. **Initialize a New Project**
   ```bash
   /init MyProject web-app
   ```

3. **Design Phase**
   ```bash
   /design-app "User authentication system with login and registration"
   ```

4. **Deploy Parallel Agents**
   ```bash
   @agent-backend-developer Design authentication APIs and database models
   @agent-frontend-developer Create login and registration UI components
   ```

## Available Commands

- `/init [project_name] [project_type]` - Initialize project with CLAUDE.md
- `/design-app [feature_description]` - Generate UI/UX designs and specs
- `/review [file_path]` - Comprehensive code review

## Available Subagents

- `@agent-backend-developer` - Server-side architecture, APIs, databases
- `@agent-frontend-developer` - UI components, client-side logic
- `@agent-security-auditor` - Security assessment and compliance

## Automation Hooks

### PreToolUse Hook
- Blocks dangerous bash commands (`rm -rf`, `sudo rm`, etc.)
- Prevents editing sensitive files (`.env`, `.key`, etc.)
- Enforces custom policies from `.claude/policies.txt`
- Warns about commits to main/master branches

### PostToolUse Hook  
- Auto-formats code (Prettier, Black, cargo fmt)
- Runs linters (ESLint, Ruff) with auto-fix
- Logs security-sensitive file modifications
- Optional test execution

### Stop Hook
- Auto-commits changes with descriptive messages
- Runs build validation
- Updates project documentation
- Sends desktop notifications

## Configuration

### Custom Policies
Create `.claude/policies.txt` to define project-specific policies:
```
# Block editing of configuration files
config/.*\.json$
# Prevent direct database operations
DROP TABLE
DELETE FROM.*WHERE
```

### Environment Variables
Configure hook behavior:
- `CLAUDE_HOOK_RUN_TESTS=true` - Enable automatic test runs
- `CLAUDE_HOOK_UPDATE_DOCS=true` - Update CLAUDE.md automatically

### Hook Logs
- `.claude/hooks.log` - General hook execution log
- `.claude/security.log` - Security policy violations
- `.claude/tasks.log` - Completed tasks log
- `.claude/commits.log` - Auto-commit history

## The Five-Phase Workflow

1. **Orchestrator Initialization** - Project scoping and CLAUDE.md creation
2. **UI Designer** - Wireframes and component specifications
3. **Parallel Specialized Agents** - Backend and frontend development
4. **Orchestrator Synthesis** - Integration and consistency validation
5. **Implementation** - Final code execution with automated quality control

## Best Practices

- Always start with a comprehensive CLAUDE.md file
- Use the master prompt template for complex projects
- Let subagents work in parallel for maximum efficiency
- Trust the hooks for quality control and automation
- Version control all framework components
- Customize policies for your specific security requirements

## Troubleshooting

- **Hook not executing**: Ensure scripts are executable (`chmod +x .claude/hooks/*.sh`)
- **Command not found**: Check command files exist in `.claude/commands/`
- **Agent not responding**: Verify agent files exist in `.claude/agents/`
- **Policy blocking**: Check `.claude/security.log` for blocked operations