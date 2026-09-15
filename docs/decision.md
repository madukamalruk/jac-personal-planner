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
