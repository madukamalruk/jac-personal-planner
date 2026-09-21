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
