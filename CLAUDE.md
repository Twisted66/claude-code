# Multi-Agent AI Development Workflow - MVP Builder

You are the **Orchestrator** for a multi-agent AI development workflow. Define the agents and steps needed to build a web application MVP based on user-provided details.

- **Project Description:** [APP_TYPE] targeting [TARGET_USERS], with key features [FEATURE_LIST], using [FRAMEWORK] and integrating APIs [API_LIST].
- **Agents:** 
  - Orchestrator (master coordinator)
  - MVP Planner/PRD Writer (creates product requirements)
  - UI/UX Designer
  - Component/Feature Architect
  - API/Backend Architect
  - Frontend Developer (framework-specific)
  - Backend Developer
  - QA/Testing Agent (test automation, code reviewer)
- **Workflow:**
  1. **Draft PRD:** Instruct the MVP Planner to write a detailed PRD (user stories, acceptance criteria) for the project. Refine the PRD iteratively.
  2. **Design App:** Run the `/dev:design-app` command to launch parallel design agents. Have the UI/UX and architecture agents create wireframes, component breakdown, data models, and API plans.
  3. **Implement App:** Use `/dev:implement-mvp` to start coding. Assign frontend and backend agents to write code according to the design into the boilerplate project structure.
  4. **Iterate:** Test and review the results. Update requirements or design as needed and re-run agents to improve the app. Continue the refine-test loop until completion.

Each agent should use its expertise to complete its task (e.g. UI designer focuses on user interface, API agent on endpoints). Use the orchestrator to coordinate transitions between these steps. Customize placeholders ([APP_TYPE], [FRAMEWORK], etc.) with your project specifics.

---

A Strategic Framework for Agentic Software Engineering with Claude Code
Executive Summary: The Paradigm Shift to Principled AI Engineering
The following report provides a detailed analysis of an advanced, multi-agent development workflow demonstrated within the Claude Code environment. The central conclusion is that this methodology represents a significant shift from ad-hoc, unstructured "vibe coding" to a disciplined, repeatable, and scalable engineering practice. This paradigm shift is enabled by the strategic integration of three core Claude Code components: subagents for task specialization, custom commands for workflow standardization, and hooks for deterministic automation.
The research indicates that the most common pitfalls of AI-driven development—including conflicting agent outputs, a lack of coordination, and inefficient context management—are directly addressed by this structured approach. By imposing a formal, phased process, the workflow ensures that the large language model (LLM) operates within a set of well-defined constraints and objectives. The workflow is not a series of disconnected prompts but a single, orchestrated system where each component plays a specific role, culminating in a reliable and high-quality output. The report deconstructs this system, elucidates the function of its foundational elements, and synthesizes them into a single, general-purpose prompt template designed for broad applicability.
Chapter 1: The Principled Workflow: Deconstructing the Multi-Agent Orchestration
1.1. The Duality of AI-Driven Development: From 'Vibe Coding' to 'Principled Engineering'
The early adoption of AI for software development has been characterized by what can be described as "vibe coding" — a largely unstructured, iterative process where developers rely on an LLM's general capabilities without a formal strategy. This approach is often prone to significant inefficiencies and failures. The research identifies a series of common mistakes, including the use of numerous conflicting agents, a complete absence of an orchestrator to coordinate outputs, the improper mixing of design and implementation phases, and a lack of a persistent memory strategy. This unstructured interaction frequently leads to the LLM becoming confused with irrelevant context, thereby diminishing its reliability.
In stark contrast, the "principled engineering" approach, as detailed in the source material, imposes a structured, multi-phase process that keeps the system "clean" and predictable. This evolution mirrors the historical development of traditional software engineering, which transitioned from chaotic "cowboy coding" to disciplined methodologies like the Software Development Lifecycle (SDLC). By adopting a phased, multi-agent model, the workflow introduces concepts from traditional software engineering such as version control (CLAUDE.md and git commits), documentation, and automated validation. The most effective AI workflows are those that import and adapt these proven engineering principles, ensuring that the process is not only effective but also repeatable and scalable.
1.2. The Five-Phase Orchestration Pattern: A Structural Analysis
The demonstrated workflow is built upon a five-phase, multi-agent orchestration pattern that provides a robust framework for complex projects. This is not a simple, single-prompt solution but a strategic sequence of distinct stages, each with a specific purpose.
 * Phase 1: Orchestrator Initialization. The process begins with the main orchestrator agent establishing the project's scope and context. This involves creating a CLAUDE.md file, which serves as the project's persistent memory, and setting up the initial file and directory structure.
 * Phase 2: UI Designer. The orchestrator then delegates the initial design task. A dedicated UI designer subagent is instructed to produce high-level wireframes and detailed specifications based on the project requirements. This clear separation of design from implementation prevents the common pitfall of mixing these distinct phases, which can lead to incoherent outputs.
 * Phase 3: Parallel Specialized Agents. This is the most critical phase of the workflow. Instead of a linear, sequential execution, the orchestrator instructs a team of specialized subagents (e.g., a backend-developer and a frontend-developer) to work on their respective parts of the project simultaneously. This parallel architecture is a core efficiency strategy, as it allows for the concurrent processing of different problem domains. The foundational enabler for this parallelism is the fact that each subagent possesses its own isolated context window, preventing the main conversation from becoming cluttered with task-specific details. This is a form of distributed computing for LLMs, where the orchestrator coordinates a team of specialized, parallel agents.
 * Phase 4: Orchestrator Synthesis. Once the parallel subagents have completed their tasks, the main Claude instance reclaims control. Its purpose in this phase is to synthesize the disparate outputs from the specialized agents, integrating them into a cohesive whole and ensuring they align with the original project vision.
 * Phase 5: Implementation with Complete Separation. In the final phase, the orchestrator oversees the implementation. The research emphasizes that this phase should be entirely separate from the design phase, focusing exclusively on translating the synthesized plan into a functional application. This process can be further streamlined by leveraging hooks, which provide a deterministic layer of automation for quality control.
The following table provides a concise overview of the five-phase orchestration pattern, mapping each stage to its core purpose and expected output.
| Phase # | Phase Name | Core Purpose | Input | Output |
|---|---|---|---|---|
| 1 | Orchestrator Initialization | Define project scope & context | High-level PRD | Initial file layout, CLAUDE.md with project rules |
| 2 | UI Designer | Create a visual and technical design plan | Design-focused prompt | Wireframes, component specifications |
| 3 | Parallel Specialized Agents | Develop distinct project components concurrently | Synthesized design plan | Modular code snippets, individual component logic |
| 4 | Orchestrator Synthesis | Combine outputs into a cohesive application plan | Outputs from all subagents | A unified, detailed implementation plan |
| 5 | Implementation | Execute the final code changes | Unified implementation plan | A complete, functional codebase |
Chapter 2: The Foundational Components: Subagents, Custom Commands, and Hooks
The seamless execution of the multi-agent workflow is dependent on a trio of foundational Claude Code components that enable specialization, standardization, and deterministic automation.
2.1. Claude Code Subagents: The Specialist Agents
Subagents are specialized AI assistants that enhance the capabilities of the main Claude Code instance. They act as dedicated helpers that can be explicitly or automatically called upon to handle task-specific work. Subagents are a mechanism for specialization and delegation, allowing the main agent to offload complex or domain-specific tasks to an expert without becoming bogged down in the details.
The most significant advantage of this architecture is its memory and context efficiency. Each subagent operates within its own isolated context window, preventing the main conversation from becoming cluttered with the minutiae of the subtask. This enables the main agent to maintain a high-level, strategic understanding of the project, a crucial concept for what is known as "context preservation".
Subagents are not ephemeral; they can be configured with specific tool access rights and stored as portable Markdown files within a project's repository (.claude/agents/). This means that an organization's collective AI expertise can be version-controlled, shared, and evolved over time, transforming the AI from a one-off assistant into a persistent, shared team member. This capability can be viewed as a form of "AI-as-Infrastructure," where the agent's definition and knowledge are treated as a core part of the project's infrastructure, subject to the same standards as source code.
2.2. Claude Code Custom Commands: The Standardized Prompting Layer
Custom slash commands allow developers to define frequently used or complex prompts as Markdown files that can be executed with a simple command. These commands provide a layer of reusability and standardization that turns ad-hoc prompts into simple, repeatable functions.
The system supports project-specific commands located in .claude/commands/ and personal commands in ~/.claude/commands/. The true power of this feature lies in its ability to accept arguments using placeholders like $ARGUMENTS or positional parameters like $1, $2, etc.. This allows for a team to codify best practices and complex workflows into a single command that can be dynamically configured. For example, a command like /review-pr can be created to accept a pull request number, priority, and assignee as arguments. The ability to include dynamic context by referencing files (@) or the output of shell commands (!) further enhances their utility, ensuring that the LLM is always working with the most current project state.
This capability enables a form of "Prompt-as-Code." A team can collaboratively define a library of commands for common tasks like /optimize or /review. When committed to a repository, this ensures that the entire team interacts with the AI in a consistent, reliable, and high-quality manner, reducing prompt drift and promoting predictable outcomes across the organization.
2.3. Claude Code Hooks: The Deterministic Automation Layer
Hooks are user-defined shell commands that execute automatically at specific, well-defined points in Claude Code's lifecycle. They provide a non-LLM, rule-based automation layer that offers a deterministic guarantee that certain actions will occur, irrespective of the LLM's reasoning. This is a fundamental strategic component for addressing the LLM's inherent unpredictability, as it decouples critical, non-creative tasks from its reasoning loop. For instance, an LLM might forget to run tests after a code change, but a PostToolUse hook can be configured to guarantee that tests are always executed after a file edit.
Hooks are triggered by a variety of lifecycle events, including PreToolUse (before a tool is called), PostToolUse (after a tool completes), Stop (when Claude finishes a task), and UserPromptSubmit (when a user submits a prompt). The PreToolUse hook is particularly powerful as it can be used to block dangerous commands (e.g., rm -rf) or enforce policy checks before an action is taken. This capability acts as a "safety rail" for the entire AI-driven workflow, turning it from a potentially risky tool into a secure, controlled engineering system. This is a game-changer for enterprise-level adoption, as it provides a critical layer of security and policy enforcement.
The following table outlines the primary hook events, their trigger conditions, and common use cases for automation.
| Hook Event | Trigger Condition | Primary Use Case | Example Automation |
|---|---|---|---|
| PreToolUse | Before Claude executes any tool call. | Block dangerous commands or enforce policies. | Prevent edits to sensitive files like .env or package-lock.json. |
| PostToolUse | After a tool completes successfully. | Automate quality control and supplementary tasks. | Auto-linting and formatting of code  or auto-running tests after a file is edited. |
| UserPromptSubmit | When the user submits a prompt. | Log and validate incoming instructions. | Sanitize user prompts before processing them. |
| Notification | When Claude Code sends a notification. | Integrate with external systems. | Send a desktop notification when Claude needs human input. |
| Stop | When Claude Code finishes responding to a prompt. | Trigger a final, wrap-up task. | Automatically create a Git commit with the last user prompt as the message. |
Chapter 3: Synthesis: Architecting a Single, Adaptable Prompt
3.1. The Strategic Integration: Mapping Workflow to Components
The effectiveness of this workflow is a direct result of the seamless integration of its three core components. The prompt is not a monolithic request but a meticulously crafted command-and-control system that orchestrates a series of actions.
The workflow begins with the master prompt and potentially a custom command like /init to set the project's memory and initial structure. The second phase is also initiated by a custom command, /design-app, which launches a specialized task. The third and most powerful phase, parallel execution, is driven by the explicit invocation of multiple subagents within the prompt itself. The master agent directs each subagent to work on a distinct task, such as one for frontend logic and another for backend.
The final implementation phase is where the strategic value of hooks becomes most apparent. While the master agent writes the code, hooks act as an asynchronous, parallel layer of quality assurance. The prompt does not need to explicitly instruct the agent to "run tests" or "lint the code." Instead, a PostToolUse hook, for example, is configured to automatically perform these checks whenever a file is modified. Similarly, a Stop hook can automatically trigger a Git commit when the entire task is complete, removing this boilerplate from the human-LLM interaction loop. This hybrid architecture, which combines the flexible, creative power of the LLM's reasoning with the rigid, reliable enforcement of rule-based automation, is the key to creating a robust, enterprise-grade AI workflow.
3.2. A General-Purpose Prompt Architecture: Modularity and Adaptability
A single, general-purpose prompt must be designed as a modular template to be adaptable to any project. The structure separates high-level orchestration from project-specific details, allowing the template to be reused while ensuring it provides the necessary context for the LLM. The prompt's architecture mirrors the workflow itself, serving as both a command and a guide.
A key element is the inclusion of a section for project-specific constraints and rules. This allows a user to "fill in the blanks" with information that is crucial for a given project, such as specific coding conventions or the existence of a pre-existing codebase. The prompt then explicitly lists the phased execution plan as a step-by-step guide, directing the LLM through the entire process from design to implementation. This modular design demonstrates an advanced approach to prompt engineering, moving from a static query to a dynamic, reusable template for an entire workflow.
Chapter 4: The Master Prompt Template: A Full Reconstruction
4.1. The Prompt: General-Purpose & Adaptable
The following is a reconstructed master prompt template designed to be a copy-and-paste-ready orchestrator for any agentic software engineering project.
Comprehensive Agentic Software Engineering Workflow
ROLE
You are an expert Chief Technology Officer (CTO) leading a team of specialized AI agents. Your primary objective is to execute a complete software engineering project from a high-level Product Requirements Document (PRD) to a fully implemented, production-ready codebase. Your work will follow a meticulously structured, five-phase workflow to ensure the highest quality, efficiency, and reliability.
CONTEXT
Below is the high-level Product Requirements Document (PRD). Your understanding of this document, combined with the project context from CLAUDE.md, will guide every decision.
<PASTE HIGH-LEVEL PRD HERE>
CONSTRAINTS & RULES
Adhere to the following rules and best practices at all times. Violating any of these rules will invalidate your work.
 * ❌ No new files without a detailed justification and analysis of existing codebase reuse.
 * ❌ No rewriting existing code when refactoring or extension is possible.
 * ✅ Extend existing services and components to maintain architectural consistency.
 * ✅ Be precise and respectful of the current codebase architecture.
 * ✅ All suggestions must reference specific, existing code files.
WORKFLOW: THE FIVE-PHASE EXECUTION PLAN
Execute the project by following these five distinct phases sequentially. The success of each phase is a prerequisite for the next.
Phase 1: Orchestrator Initialization & Project Scoping
 * Your first task is to formalize the project's memory and structure.
 * Use the /init command to analyze the codebase and create a CLAUDE.md file.
 * Populate CLAUDE.md with a high-level project architecture, key dependencies, and coding conventions based on the PRD.
 * Then, create the necessary high-level directory structure (e.g., src, tests, docs) to contain the project's components.
 * Do not write any code in this phase.
Phase 2: UI & UX Design
 * The primary task of this phase is design, not implementation.
 * Use the /design-app custom command to generate wireframes, component specifications, and a detailed user experience flow.
 * Do not write any backend logic or API code in this phase.
Phase 3: Parallel Specialized Agent Execution
 * Now, it's time to delegate to your team of experts.
 * Use the backend-developer subagent to design the server-side architecture and APIs. Instruct it to generate all API schemas and database models as separate files.
 * Simultaneously, use the frontend-developer subagent to implement the user interface components based on the design specifications from Phase 2. Instruct it to create all UI files and component logic.
 * These two tasks must run in parallel. Do not move to the next phase until both subagents report their completion.
Phase 4: Orchestrator Synthesis & Final Plan
 * Reclaim control from the subagents.
 * Your task is to synthesize the work of the backend-developer and frontend-developer into a single, cohesive, final implementation plan.
 * Ensure the API calls in the frontend match the schemas from the backend.
 * Verify all implementation details for consistency and correctness.
Phase 5: Implementation & Finalization
 * Based on the final plan from Phase 4, execute all necessary code changes to implement the full feature.
 * Your final action is to confirm all work is complete. You do not need to explicitly run tests or commit the code; this will be handled automatically by the system's hooks.
INSTRUCTIONS
Begin the workflow now.
4.2. Prompt Annotations and Usage Guide
The master prompt is a meticulously crafted command-and-control system for an AI agent, designed to be executed from the command line after a user has set up the project. The ### CONTEXT section is where the user pastes a simplified PRD, which, combined with the project memory (CLAUDE.md), provides the LLM with the necessary understanding.
The ### CONSTRAINTS & RULES section operationalizes the "principled engineering" approach. These rules, drawn from established best practices, provide a direct, unambiguous guardrail for the LLM's behavior, preventing it from making common mistakes like creating duplicate files or ignoring existing architecture.
The ### WORKFLOW section is the core of the prompt. It explicitly lays out the five-phase plan, serving as a script for the LLM to follow. It directs the use of built-in commands like /init and references the project-specific custom command /design-app to standardize the design phase. Most importantly, it explicitly invokes the subagents, like backend-developer and frontend-developer, and directs them to run their tasks in parallel. This is how the modular design and the multi-agent architecture are put into practice.
Finally, the prompt's simplicity in the last step—"You do not need to explicitly run tests or commit the code"—highlights its implicit reliance on hooks. The workflow's reliability is contingent on a parallel automation layer that automatically runs quality checks (e.g., a PostToolUse hook for ruff check --fix) and finalizes the work (e.g., a Stop hook for git commit). This approach demonstrates an advanced understanding of AI workflow design, where the LLM is trusted with creative tasks while the critical, non-creative, and security-sensitive tasks are handled by deterministic automation.
Chapter 5: Conclusion and Strategic Recommendations
5.1. Summary of Findings
The analysis reveals that the most reliable and efficient AI-driven development workflows are those that abandon ad-hoc prompting in favor of a structured, multi-agent architecture. The success of this approach is founded on the seamless integration of three distinct components:
 * Subagents provide a mechanism for task specialization and efficient memory management, preventing context pollution in the main conversation.
 * Custom commands serve as a standardization layer, transforming complex prompts into reusable, parameterized functions that a team can share and version-control.
 * Hooks act as a critical, rule-based automation layer, providing deterministic guarantees for quality control, security, and process enforcement that are impossible to achieve with a prompt alone.
The master prompt itself is not a magic bullet but an orchestrator that leverages these foundational components to direct a complete, phased, and parallelized workflow. This hybrid architecture, which marries the flexible power of an LLM with the rigid reliability of rule-based automation, is the key to creating a robust and secure engineering system.
5.2. Recommendations for Implementation
For a technical team to successfully adopt this workflow, a strategic, multi-step implementation plan is necessary. The true value is not in the single prompt but in the broader, disciplined approach it represents.
 * Start with Project Documentation: The first and most crucial step is to create a detailed CLAUDE.md file. This file serves as the project's permanent memory, providing the AI with the necessary context about architecture, dependencies, and rules. This should be treated as a core project asset and committed to the repository for team-wide access.
 * Standardize with Custom Commands: Develop a library of project-specific custom commands. These commands should encapsulate common, complex workflows, such as /design-app or /review, ensuring that all team members interact with the AI in a consistent manner. This repository of commands should be version-controlled alongside the codebase.
 * Specialize with Subagents: Once the commands are in place, build and version-control specialized subagents within the .claude/agents/ directory. Define their purpose, system prompts, and tool access rights to align with specific project needs, such as a dedicated security-auditor or performance-optimizer subagent.
 * Automate with Hooks: Implement hooks to enforce critical quality and security policies. Treat this as a non-negotiable part of the workflow, similar to a CI/CD pipeline. Configure PostToolUse hooks to run linting and testing, and PreToolUse hooks to prevent edits to sensitive files. This provides the "safety rails" that allow for reliable, high-speed development.
By following these recommendations, an organization can move beyond ad-hoc AI use and establish a principled, scalable, and reliable engineering practice that leverages the full power of the Claude Code platform.
