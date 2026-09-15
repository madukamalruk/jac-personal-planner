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
walker:priv AddTask {
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
        here +:task_edge:+> task;
        report task;
    }
}

walker:priv ListTasks {
    has reports: list[TaskNode] = [];

    can collect with Root entry {
        visit [-:task_edge:->];
    }

    can gather with TaskNode entry {
        report here;
    }
}
