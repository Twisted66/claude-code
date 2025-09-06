#!/bin/bash
# Stop Hook - Final automation when Claude completes a task
# This hook runs when Claude finishes responding to a prompt

# Get hook environment variables
USER_PROMPT="$CLAUDE_HOOK_USER_PROMPT"
WORKING_DIR="$PWD"

# Log task completion
echo "$(date): Task completed - $USER_PROMPT" >> .claude/tasks.log

# Auto-commit changes if in a git repository
if [ -d ".git" ]; then
    # Check if there are any changes to commit
    if ! git diff --quiet || ! git diff --cached --quiet; then
        echo "Auto-committing changes..."
        
        # Add all modified files (but not untracked files by default)
        git add -u
        
        # Create commit message from user prompt (truncated to reasonable length)
        COMMIT_MSG=$(echo "$USER_PROMPT" | head -c 100)
        if [ ${#USER_PROMPT} -gt 100 ]; then
            COMMIT_MSG="${COMMIT_MSG}..."
        fi
        
        # Create commit with Claude attribution
        git commit -m "$COMMIT_MSG

🤖 Generated with Claude Code

Co-Authored-By: Claude <noreply@anthropic.com>" >/dev/null 2>&1
        
        if [ $? -eq 0 ]; then
            echo "Changes committed successfully"
            echo "$(date): Auto-committed: $COMMIT_MSG" >> .claude/commits.log
        else
            echo "Commit failed - check git status"
        fi
    else
        echo "No changes to commit"
    fi
fi

# Run final project validation (optional)
if [ -f "package.json" ]; then
    # Check if build/test scripts are available
    if npm run | grep -q "build"; then
        echo "Running build validation..."
        if npm run build >/dev/null 2>&1; then
            echo "✅ Build successful"
        else
            echo "❌ Build failed - check output"
        fi
    fi
    
    # Run quick tests if available
    if npm run | grep -q "test" && [ "$CLAUDE_HOOK_RUN_TESTS" = "true" ]; then
        echo "Running tests..."
        if npm test >/dev/null 2>&1; then
            echo "✅ Tests passed"
        else
            echo "❌ Tests failed - check output"
        fi
    fi
fi

# Update CLAUDE.md with latest changes (if it exists)
if [ -f "CLAUDE.md" ] && [ "$CLAUDE_HOOK_UPDATE_DOCS" = "true" ]; then
    echo "Updating project documentation..."
    echo "" >> CLAUDE.md
    echo "## Latest Changes ($(date))" >> CLAUDE.md
    echo "Task: $USER_PROMPT" >> CLAUDE.md
    
    # Add list of modified files
    if [ -d ".git" ]; then
        MODIFIED_FILES=$(git diff --name-only HEAD~1 2>/dev/null || echo "No git history")
        if [ "$MODIFIED_FILES" != "No git history" ]; then
            echo "Modified files:" >> CLAUDE.md
            echo "$MODIFIED_FILES" | sed 's/^/- /' >> CLAUDE.md
        fi
    fi
fi

# Send desktop notification (if available)
if command -v notify-send >/dev/null 2>&1; then
    notify-send "Claude Code" "Task completed: $COMMIT_MSG" >/dev/null 2>&1 || true
fi

exit 0