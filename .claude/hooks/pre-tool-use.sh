#!/bin/bash
# PreToolUse Hook - Security and policy enforcement before tool execution
# This hook runs automatically before Claude executes any tool

# Get hook environment variables
TOOL_NAME="$CLAUDE_HOOK_TOOL_NAME"
TOOL_PARAMS="$CLAUDE_HOOK_TOOL_PARAMS"
WORKING_DIR="$PWD"

# Log tool usage for debugging (optional)
echo "$(date): PreToolUse hook triggered for $TOOL_NAME" >> .claude/hooks.log

# Security policies - prevent dangerous operations
case "$TOOL_NAME" in
    "Bash")
        # Block dangerous bash commands
        if echo "$TOOL_PARAMS" | grep -E "(rm -rf|sudo rm|format|mkfs|dd if=)" >/dev/null; then
            echo "BLOCKED: Dangerous command detected"
            echo "$(date): Blocked dangerous bash command: $TOOL_PARAMS" >> .claude/security.log
            exit 1
        fi
        
        # Block network operations that could be risky
        if echo "$TOOL_PARAMS" | grep -E "(curl.*-X POST|wget.*--post|nc -l)" >/dev/null; then
            echo "BLOCKED: Potentially risky network operation"
            echo "$(date): Blocked risky network command: $TOOL_PARAMS" >> .claude/security.log
            exit 1
        fi
        ;;
        
    "Edit"|"Write"|"MultiEdit")
        # Prevent editing sensitive files
        if echo "$TOOL_PARAMS" | grep -E "\.(env|key|pem|p12|pkcs12)" >/dev/null; then
            echo "BLOCKED: Attempt to edit sensitive file"
            echo "$(date): Blocked edit of sensitive file: $TOOL_PARAMS" >> .claude/security.log
            exit 1
        fi
        
        # Prevent editing system files
        if echo "$TOOL_PARAMS" | grep -E "/(etc|usr/bin|usr/sbin|boot)/" >/dev/null; then
            echo "BLOCKED: Attempt to edit system file"
            echo "$(date): Blocked edit of system file: $TOOL_PARAMS" >> .claude/security.log
            exit 1
        fi
        
        # Prevent editing lock files without approval
        if echo "$TOOL_PARAMS" | grep -E "(package-lock\.json|yarn\.lock|Pipfile\.lock|poetry\.lock)" >/dev/null; then
            echo "BLOCKED: Attempt to edit lock file - use package manager instead"
            echo "$(date): Blocked edit of lock file: $TOOL_PARAMS" >> .claude/security.log
            exit 1
        fi
        ;;
esac

# Project-specific policies
if [ -f ".claude/policies.txt" ]; then
    # Load custom policies from .claude/policies.txt
    while IFS= read -r policy; do
        if [ ! -z "$policy" ] && [[ ! "$policy" =~ ^# ]]; then
            # Simple pattern matching for custom policies
            if echo "$TOOL_PARAMS" | grep -E "$policy" >/dev/null; then
                echo "BLOCKED: Custom policy violation"
                echo "$(date): Custom policy blocked: $policy" >> .claude/security.log
                exit 1
            fi
        fi
    done < ".claude/policies.txt"
fi

# Check for git repository and prevent accidental commits to main/master
if [[ "$TOOL_NAME" == "Bash" ]] && echo "$TOOL_PARAMS" | grep -E "git.*commit" >/dev/null; then
    CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
    if [[ "$CURRENT_BRANCH" == "main" || "$CURRENT_BRANCH" == "master" ]]; then
        echo "WARNING: Committing directly to $CURRENT_BRANCH branch"
        echo "Consider creating a feature branch first"
        # Don't block, just warn
    fi
fi

exit 0