# Agentic Software Engineering Framework

A comprehensive framework for transforming AI-assisted development from chaotic "vibe coding" into disciplined, scalable "principled engineering" using Claude Code.

## Overview

This framework implements a strategic five-phase orchestration pattern that addresses common pitfalls in AI-driven development through structured multi-agent workflows with automated quality control.

## Key Features

- **🤖 Specialized Subagents** - Backend, frontend, and security experts with isolated contexts
- **⚡ Custom Commands** - Reusable, parameterized prompts for consistent workflows  
- **🔐 Automation Hooks** - Deterministic security, formatting, and quality control
- **📋 Five-Phase Workflow** - From PRD to production-ready code
- **🛡️ Security Enforcement** - Prevent dangerous operations and policy violations

## Quick Start

### 1. Copy Framework to Your Project
```bash
# Copy the .claude/ directory to your project root
cp -r /path/to/this/repo/.claude /path/to/your/project/
```

### 2. Initialize Your Project
```bash
/init MyProject web-app
```

### 3. Use the Master Prompt Template
Copy from `.claude/master-prompt.md`, replace the PRD section with your requirements, and execute.

### 4. Deploy Parallel Agents
```bash
@agent-backend-developer Design authentication APIs and database models
@agent-frontend-developer Create login and registration UI components
```

## Framework Components

### Specialized Subagents (`.claude/agents/`)
- **backend-developer** - Server architecture, APIs, databases
- **frontend-developer** - UI components, client-side logic  
- **security-auditor** - Security assessments and compliance

### Custom Commands (`.claude/commands/`)
- `/init` - Initialize project structure and CLAUDE.md
- `/design-app` - UI/UX design phase with wireframes
- `/review` - Comprehensive code review process

### Automation Hooks (`.claude/hooks/`)
- **pre-tool-use.sh** - Security policies and dangerous command blocking
- **post-tool-use.sh** - Auto-formatting, linting, quality control
- **stop.sh** - Auto-commits, build validation, documentation updates

## The Five-Phase Workflow

1. **Orchestrator Initialization** - Project scoping and memory setup
2. **UI Designer** - Wireframes and component specifications
3. **Parallel Specialized Agents** - Backend and frontend development
4. **Orchestrator Synthesis** - Integration and consistency validation  
5. **Implementation** - Final execution with automated quality control

## Global Configuration

### Make Framework Available Globally

1. **Symlink to Global Commands Directory**
```bash
ln -sf "$(pwd)/.claude/commands" ~/.claude/commands/agentic
```

2. **Copy Agents to Global Directory**  
```bash
cp .claude/agents/* ~/.claude/agents/
```

3. **Set Global Hooks**
```bash
ln -sf "$(pwd)/.claude/hooks"/* ~/.claude/hooks/
```

## Security Features

- Blocks dangerous bash commands (`rm -rf`, `sudo rm`, etc.)
- Prevents editing sensitive files (`.env`, keys, certificates)
- Custom policy enforcement via `.claude/policies.txt`
- Audit logging for security events
- Auto-commit with attribution and change tracking

## Project Structure

```
your-project/
├── .claude/                    # Framework configuration
│   ├── agents/                 # Specialized subagents
│   ├── commands/               # Custom slash commands
│   ├── hooks/                  # Automation scripts
│   ├── master-prompt.md        # Complete workflow template
│   └── README.md               # Framework documentation
├── CLAUDE.md                   # Project memory and rules
└── [your project files]
```

## Best Practices

- Always start with comprehensive CLAUDE.md documentation
- Use master prompt template for complex multi-phase projects
- Let subagents work in parallel for maximum efficiency
- Trust hooks for deterministic quality control
- Version control all framework components
- Customize security policies for your specific requirements

## Examples

### Web Application Development
```bash
/init MyWebApp react-nodejs
/design-app "E-commerce platform with user authentication and product catalog"
# Execute master prompt with e-commerce PRD
```

### API Development
```bash
/init MyAPI fastapi
@agent-backend-developer "Create RESTful API for task management with CRUD operations"
```

### Security Review
```bash
@agent-security-auditor "Perform comprehensive security assessment of authentication system"
```

## Contributing

This framework is designed to be extended and customized. Add your own:

- Specialized subagents for your domain
- Custom commands for your workflow patterns  
- Additional hooks for your quality requirements
- Security policies for your compliance needs

## License

MIT License - Feel free to use, modify, and distribute.

---

**Transform your AI development from chaos to discipline with principled engineering practices.**