# Architecture Document

## Tech Stack
- **Language:** Jac Programming Language (Full-stack).
- **Backend & Persistence:** Jac's native Object-Spatial Programming (Nodes, Edges, Walkers). No external databases (like MySQL/MongoDB) are needed as Jac handles data persistence internally.
- **Frontend (Web):** Jac's native UI components (compiled to JavaScript/WebAssembly).
- **Frontend (Mobile):** Jac's mobile app framework.
- **AI Integration:** Jac's native LLM capabilities (ByLLM) embedded directly into functions.

## Project Structure
```text
planner/
├── docs/               # Long-term memory and project specifications
├── main.jac            # Server entry point / Backend logic
├── frontend.jac        # Web Frontend entry point
├── frontend.impl.jac   # Web Frontend implementation details
├── endpoints.jac       # API endpoints for interactions
├── components/         # Shared UI components
└── mobile/             # Mobile App workspace
    ├── screens/        # Mobile UI screens
    └── components/     # Mobile UI components
```

## Data Model (Graph Structure)
- **Root Node:** User's main planning hub.
- **Node Types:** 
  - `TaskNode`: Contains title, description, status, due_date, priority.
  - `EventNode`: Contains title, start_time, end_time, location.
  - `HabitNode`: Contains title, frequency, streak_count.
- **Edges:** Nodes are connected directly to the Root node using specific typed edges (`task_edge`, `event_edge`, `habit_edge`).
- **Walkers:** Traverse the graph to retrieve the daily schedule, resolve conflicts, and generate AI reflections.
