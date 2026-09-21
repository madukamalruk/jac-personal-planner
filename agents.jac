"""planner - AI Agentic Workflows.

This module contains the LLM-powered walkers (Agents) that traverse
the graph to provide intelligent planning capabilities.
"""

import from endpoints { TaskNode, ListTasks }

# Schedule Resolver Agent
walker:priv ScheduleResolver {
    has conflicts: list[str] = [],
        proposed_schedule: str = "";

    can identify_conflicts with Root entry {
        # Collect all tasks
        all_tasks = spawn here ++> ListTasks();
        tasks_data = [];
        for t in all_tasks.reports {
            tasks_data.append({
                "title": t.title,
                "due_date": t.due_date,
                "status": t.status,
                "priority": t.priority
            });
        }
        
        # Analyze using ByLLM
        if tasks_data {
            analysis = self.analyze_schedule(tasks_data);
            self.conflicts = analysis["conflicts"];
            self.proposed_schedule = analysis["proposed_schedule"];
        }
        
        report {
            "conflicts": self.conflicts,
            "proposed_schedule": self.proposed_schedule
        };
    }

    # Using Jac's native AI capability (by llm)
    can analyze_schedule(tasks: list[dict]) -> dict by llm(
        method="Reasoning",
        task="Analyze the provided tasks. Identify if there are any impossible deadlines or scheduling overlaps. Then, draft a proposed rearranged schedule. Do not change the original data, just return a report. Format output as a dict with keys 'conflicts' (list of strings) and 'proposed_schedule' (string).",
        context={"tasks": tasks}
    );
}

# Reflection Agent
walker:priv ReflectionAgent {
    has time_of_day: str,
        briefing: str = "";

    can generate_reflection with Root entry {
        all_tasks = spawn here ++> ListTasks();
        tasks_data = [];
        for t in all_tasks.reports {
            if t.status != "done" {
                tasks_data.append({"title": t.title, "priority": t.priority});
            }
        }
        
        if self.time_of_day == "morning" {
            self.briefing = self.create_morning_briefing(tasks_data);
        } else {
            self.briefing = self.create_evening_reflection(tasks_data);
        }
        
        report self.briefing;
    }

    can create_morning_briefing(tasks: list[dict]) -> str by llm(
        method="Reasoning",
        task="Create a highly motivational morning briefing. Pick the top 3 highest priority tasks from the list provided and present them as the main goals for the day. Keep it encouraging and concise.",
        context={"tasks": tasks}
    );
    
    can create_evening_reflection(tasks: list[dict]) -> str by llm(
        method="Reasoning",
        task="Create a thoughtful evening reflection. Acknowledge the tasks that are still pending and offer a gentle, encouraging message to prepare for tomorrow.",
        context={"tasks": tasks}
    );
}

# Habit Coach Agent
walker:priv HabitCoachAgent {
    has suggested_habit: str = "";

    can analyze_free_time with Root entry {
        # Fetch current tasks to infer free time
        all_tasks = spawn here ++> ListTasks();
        tasks_data = [];
        for t in all_tasks.reports {
            if t.status != "done" {
                tasks_data.append({"title": t.title, "due_date": t.due_date});
            }
        }
        
        self.suggested_habit = self.suggest_habit_for_gaps(tasks_data);
        report self.suggested_habit;
    }

    can suggest_habit_for_gaps(tasks: list[dict]) -> str by llm(
        method="Reasoning",
        task="Analyze the current tasks list. Assume the user has some small free time blocks (e.g., 15 mins) between these tasks. Suggest exactly one highly actionable, small habit (like reading 5 pages, drinking water, or doing a 10-min stretch) that perfectly fits a gap. Present it as a friendly question.",
        context={"tasks": tasks}
    );
}
