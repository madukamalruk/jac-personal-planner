# AI Agents & Workflows

This document outlines the specialized AI sub-agents that operate within the Jac environment to form the "Agentic Workflow" required by the course.

## 1. Schedule Resolver Agent
- **Role:** Monitors the user's schedule for overlapping events or unrealistic task estimations.
- **Action:** When a conflict is found, it evaluates priorities and available free blocks to suggest a rearranged schedule.

## 2. Reflection Agent
- **Role:** Acts as a daily companion.
- **Action (Morning):** Summarizes the day's most critical tasks and creates a motivational briefing.
- **Action (Evening):** Reviews completed vs. uncompleted tasks and asks the user for a quick reflection to improve future scheduling.

## 3. Habit Coach Agent
- **Role:** Focuses on long-term habit formation.
- **Action:** Analyzes the user's free time and suggests optimal slots for habits (e.g., "You have 30 mins free after work today, great time to read"). Tracks consistency over time.
