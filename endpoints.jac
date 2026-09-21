"""planner - Server-Side Data Layer & Graph Structure.

Defines the Nodes, Edges, and basic Walkers for the Personal Planning App.
"""

# ----------------- EDGES -----------------
edge task_edge {}
edge event_edge {}
edge habit_edge {}

# ----------------- NODES -----------------
node TaskNode {
    has title: str,
        description: str,
        status: str = "pending",
        due_date: str = "",
        priority: str = "medium";
}

node EventNode {
    has title: str,
        start_time: str,
        end_time: str,
        location: str = "";
}

node HabitNode {
    has title: str,
        frequency: str = "daily",
        streak_count: int = 0;
}

# ----------------- WALKERS -----------------
walker:pub AddTask {
    has title: str,
        description: str,
        due_date: str = "",
        priority: str = "medium",
        reports: list[TaskNode] = [];

    can post with Root entry {
        task = TaskNode(
            title=self.title,
            description=self.description,
            due_date=self.due_date,
            priority=self.priority
        );
        here ++> task;
        report task;
    }
}

walker:pub ListTasks {
    has reports: list[TaskNode] = [];

    can collect with Root entry {
        visit [-->];
    }

    can gather with TaskNode entry {
        report here;
    }
}

walker:pub SetupMockData {
    can setup with Root entry {
        here spawn AddTask(title="Finish AI Masterclass Assignment", description="Complete the backend walkers and frontend UI.", due_date="Today 5:00 PM", priority="high");
        here spawn AddTask(title="Team Meeting", description="Discuss project architecture.", due_date="Today 4:00 PM - 5:30 PM", priority="high");
        here spawn AddTask(title="Grocery Shopping", description="Buy milk, eggs, and bread.", due_date="Today 6:00 PM", priority="low");
        here spawn AddTask(title="Read Research Paper", description="Read the latest Jac language documentation.", due_date="Tomorrow 9:00 AM", priority="medium");
        report "Mock Data Added!";
    }
}
