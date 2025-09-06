# Code Review Command

This command performs comprehensive code review focusing on quality, security, and architectural consistency.

## Usage
```
/review [file_path_or_pattern]
```

## Arguments
- `$ARGUMENTS` - File path, directory, or glob pattern to review (optional, defaults to recent changes)

## Command

You are performing a comprehensive code review as part of the agentic software engineering workflow.

## Review Scope
Target: ${ARGUMENTS:-recent changes and modified files}

## Review Checklist

1. **Architectural Consistency**
   - Verify changes align with existing codebase patterns
   - Check adherence to CLAUDE.md project rules and conventions
   - Ensure no unnecessary new files or duplicate code

2. **Code Quality**
   - Review for readability, maintainability, and performance
   - Check proper error handling and edge cases
   - Verify appropriate logging and debugging information

3. **Security Analysis**
   - Identify potential security vulnerabilities
   - Check for hardcoded secrets or sensitive data exposure
   - Verify input validation and sanitization

4. **Testing Coverage**
   - Ensure adequate test coverage for new functionality
   - Verify tests are meaningful and test edge cases
   - Check for proper mocking and test isolation

5. **Documentation**
   - Verify code is self-documenting with clear naming
   - Check for necessary comments explaining complex logic
   - Ensure API documentation is updated if applicable

6. **Dependencies**
   - Review any new dependencies for necessity and security
   - Check for version compatibility and conflicts
   - Verify licenses are compatible with project requirements

## Output Format
Provide structured review with:
- ✅ **Approved items** - What looks good
- ⚠️  **Minor issues** - Suggestions for improvement
- ❌ **Critical issues** - Must be addressed before merge
- 💡 **Recommendations** - Optional improvements

Files to review: $ARGUMENTS

Begin code review now.