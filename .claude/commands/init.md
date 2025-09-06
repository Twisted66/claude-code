# Initialize Project Command

This command initializes a new project with the agentic software engineering framework, creating the CLAUDE.md file and setting up the basic project structure.

## Usage
```
/init [project_name] [project_type]
```

## Arguments
- `$1` - Project name (optional, defaults to current directory name)
- `$2` - Project type (optional, e.g., "web-app", "api", "mobile")

## Command

You are initializing a new project using the agentic software engineering framework. Follow these steps:

1. **Analyze Current Directory Structure**
   - List all existing files and directories
   - Identify the project type based on existing files (package.json, requirements.txt, etc.)
   - Determine the primary programming language and frameworks in use

2. **Create Comprehensive CLAUDE.md File**
   - Document the project architecture and key components
   - List all dependencies and their versions
   - Define coding conventions and style guidelines
   - Establish project-specific rules and constraints
   - Include build commands, test commands, and deployment procedures

3. **Set Up Basic Project Structure**
   - Create essential directories if they don't exist (src, tests, docs)
   - Ensure proper .gitignore is in place
   - Verify package manager files are properly configured

4. **Initialize Framework Components**
   - Document available subagents for this project type
   - List recommended custom commands for this project
   - Suggest useful hooks for automation

Project Name: ${1:-$(basename $(pwd))}
Project Type: ${2:-auto-detect}

Begin initialization now.