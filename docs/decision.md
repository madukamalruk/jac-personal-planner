# Decision Log (ADR)

## Decision: Unified Full-Stack Language
- **Decision:** Use Jac Language for Backend, Web, Mobile, and CLI.
- **Reasoning:** It's the core requirement of the "AI MasterClass 2026" course. It eliminates the need for glue code and external databases, significantly reducing boilerplate.

## Decision: Agentic Coding "Long-Term Memory"
- **Decision:** Maintain `prd.md`, `architecture.md`, `agents.md`, `decision.md`, and `tasks.md` in the `docs/` folder.
- **Reasoning:** As the project grows, these files will serve as the ground truth for the AI assistant, ensuring context retention across long chat sessions and reducing hallucinations.

## Decision: Combined AI Features
- **Decision:** Integrate Schedule Resolution, Daily Reflection, and Habit Coaching into a single cohesive Agentic Workflow.
- **Reasoning:** The user requested a comprehensive AI experience ("2, 3, and 4 combined"). This provides a highly personalized and intelligent planning tool.

## Decision: Data Model Node Types
- **Decision:** Use separate node types (`TaskNode`, `EventNode`, `HabitNode`) instead of a generic node.
- **Reasoning:** Provides clarity, stronger typing, and allows specialized AI behaviors for each type without cluttering a single node structure.

## Decision: Graph Edges Topology
- **Decision:** Connect `TaskNode`, `EventNode`, and `HabitNode` directly to the `Root` node using specific typed edges (`task_edge`, etc.).
- **Reasoning:** Keeps the graph shallow and fast to query via Walkers, avoiding unnecessary intermediate category nodes.

## Decision: AI Schedule Resolver Logic
- **Decision:** The agent will identify both overlaps and impossible deadlines as conflicts. To resolve them, it will flag the conflict and propose a draft schedule, requiring user confirmation before automatically modifying nodes.
- **Reasoning:** Ensures the AI is proactive but does not make destructive changes to the user's schedule without consent (User selected options 1 and 3).

## Decision: AI Reflection Logic
- **Decision:** The Reflection Agent provides a morning briefing (motivational summary + top 3 tasks) and an evening reflection. It triggers automatically when opening the app and sends push notifications.
- **Reasoning:** User requested both in-app auto-trigger and push notifications, with an emphasis on a motivational morning start.

## Decision: AI Habit Coach Logic
- **Decision:** The Habit Coach Agent will analyze the user's free time blocks and suggest 1 or 2 small habits tailored to those specific gaps.
- **Reasoning:** This creates a more dynamic and personalized coaching experience rather than just scheduling static user-input habits.

## Decision: Mobile App Design
- **Decision:** The primary view is a combined dashboard (Morning Briefing + Schedule). Task entry utilizes a flexible approach: a Quick Add FAB by default, with a "More" button for full details, and a Voice Input icon for hands-free entry.
- **Reasoning:** Maximizes efficiency on mobile devices while providing advanced options when needed (User requested all 3 methods seamlessly integrated).

## Decision: Testing & Demo Day Strategy
- **Decision:** Use a realistic "busy week" mock dataset (overlapping tasks, tight deadlines) to thoroughly stress-test the AI Agentic workflows. For the Demo Day, prepare both a Live Demonstration of the AI resolving a conflict, and a Pre-recorded Video as a failsafe backup.
- **Reasoning:** Robust testing ensures the AI features shine. Having a backup video guarantees a smooth presentation regardless of live technical issues.
