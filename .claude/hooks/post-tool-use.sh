#!/bin/bash
# PostToolUse Hook - Automation after tool execution
# This hook runs automatically after Claude successfully executes any tool

# Get hook environment variables
TOOL_NAME="$CLAUDE_HOOK_TOOL_NAME"
TOOL_RESULT="$CLAUDE_HOOK_TOOL_RESULT"
WORKING_DIR="$PWD"

# Log tool usage for debugging (optional)
echo "$(date): PostToolUse hook triggered for $TOOL_NAME" >> .claude/hooks.log

# Auto-formatting and linting after file edits
if [[ "$TOOL_NAME" == "Edit" || "$TOOL_NAME" == "Write" || "$TOOL_NAME" == "MultiEdit" ]]; then
    # Check if we're in a Node.js project
    if [ -f "package.json" ]; then
        # Run prettier if available
        if command -v npx >/dev/null 2>&1 && npm list prettier >/dev/null 2>&1; then
            echo "Running Prettier formatting..."
            npx prettier --write . >/dev/null 2>&1 || true
        fi
        
        # Run ESLint if available
        if command -v npx >/dev/null 2>&1 && npm list eslint >/dev/null 2>&1; then
            echo "Running ESLint..."
            npx eslint . --fix >/dev/null 2>&1 || true
        fi
    fi
    
    # Check if we're in a Python project
    if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
        # Run black if available
        if command -v black >/dev/null 2>&1; then
            echo "Running Black formatting..."
            black . >/dev/null 2>&1 || true
        fi
        
        # Run ruff if available
        if command -v ruff >/dev/null 2>&1; then
            echo "Running Ruff linting..."
            ruff check --fix . >/dev/null 2>&1 || true
        fi
    fi
    
    # Check if we're in a Rust project
    if [ -f "Cargo.toml" ]; then
        # Run cargo fmt if available
        if command -v cargo >/dev/null 2>&1; then
            echo "Running cargo fmt..."
            cargo fmt >/dev/null 2>&1 || true
        fi
    fi
    
    # Run tests after code changes (optional - uncomment if desired)
    # if [ -f "package.json" ] && npm list jest >/dev/null 2>&1; then
    #     echo "Running tests..."
    #     npm test >/dev/null 2>&1 || true
    # fi
fi

# Security check - prevent editing sensitive files
if [[ "$TOOL_NAME" == "Edit" || "$TOOL_NAME" == "Write" ]]; then
    # Extract file path from tool result if possible
    FILE_PATH=$(echo "$TOOL_RESULT" | grep -o "/[^'\"]*\.\(env\|key\|pem\|p12\)" || true)
    if [ ! -z "$FILE_PATH" ]; then
        echo "WARNING: Sensitive file was modified: $FILE_PATH"
        echo "$(date): Sensitive file modified: $FILE_PATH" >> .claude/security.log
    fi
fi

exit 0