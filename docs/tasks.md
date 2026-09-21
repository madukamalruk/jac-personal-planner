# Implementation Plan (Tasks)

## Phase 1: Planning & Setup
- [x] Project Scaffolding (Jac Web App + Mobile).
- [x] Establish Long-Term Memory (Create docs/ folder with prd, architecture, etc.).

## Phase 2: Backend & Data Model
- [x] Define Jac nodes and edges for Tasks, Events, and Habits.
- [x] Create Walkers to add, update, and retrieve tasks.
- [x] Implement CLI script to interact with Walkers (Add Task, View Schedule).

## Phase 3: Web Frontend
- [x] Design the main Dashboard UI.
- [x] Connect Web UI to the Backend via Walkers/Endpoints.
- [x] Extract reusable TaskCard component.

## Phase 4: AI Agentic Workflows
- [x] Implement `Schedule Resolver Agent` logic (ByLLM integration).
- [x] Implement `Reflection Agent` logic.
- [x] Implement `Habit Coach Agent` logic.
- [x] Connect AI Agents to Web Dashboard (AI Morning Briefing + Habit Coach buttons).

## Phase 5: Mobile App
- [x] Design Mobile screens (Home, Schedule).
- [x] Connect Mobile app to the Backend.

## Phase 6: Testing & Polish
- [x] End-to-end testing of all 4 components using mock data.
- [x] Final preparations for Demo Day (Live demo & Backup video).

## Debugging & Fixes Applied
- [x] Fixed `main.jac` stale imports (Message -> TaskNode).
- [x] Fixed Walker permissions (`walker:priv` -> `walker:pub`) to resolve 401 errors.
- [x] Fixed Jac edge syntax (`+:task_edge:+>` -> `++>`).
- [x] Fixed Walker spawn syntax (`root spawn Walker()`).
- [x] Fixed `agents.jac` by llm() declarations (`can` -> `def`).
- [x] Removed JSX ternary operators (`? :`) not supported by Jac's JSX parser.
- [x] Removed complex inline JS from JSX to prevent Jac compile errors.
