"""Implementations for the planner frontend component."""

impl app.loadTasks -> None {
    result = root spawn ListTasks();
    tasks = result.reports;
}

impl app.postTask(e: FormEvent) -> None {
    e.preventDefault();
    if not title.strip() {
        return;
    }
    result = root spawn AddTask(title=title, description=desc, priority=priority);
    tasks = tasks + [result.reports[0]];
    title = "";
    desc = "";
    priority = "medium";
}

impl app.getAiBriefing -> None {
    ai_response = "Thinking... 💭";
    result = root spawn ReflectionAgent(time_of_day="morning");
    ai_response = result.reports[0];
}

impl app.getHabitAdvice -> None {
    ai_response = "Analyzing schedule for habits... 💭";
    result = root spawn HabitCoachAgent();
    ai_response = result.reports[0];
}

