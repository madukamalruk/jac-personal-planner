"""planner - Client-Side UI."""

import from .components.TaskCard { TaskCard }
import from endpoints { TaskNode, AddTask, ListTasks }
import from agents { ReflectionAgent, HabitCoachAgent, ScheduleResolver }

def:pub app -> JsxElement {
    has tasks: list[TaskNode] = [],
        title: str = "",
        desc: str = "",
        priority: str = "medium",
        ai_response: str = "";

    # Load existing tasks once, when the component first mounts.
    can with entry {
        loadTasks();
    }

    async def loadTasks -> None;
    async def postTask(e: FormEvent) -> None;
    async def getAiBriefing -> None;
    async def getHabitAdvice -> None;

    <div
        style={{
            "maxWidth": "800px",
            "margin": "2rem auto",
            "padding": "0 1rem",
            "fontFamily": "system-ui, -apple-system, sans-serif",
            "color": "#1a1a2e"
        }}
    >
        <h1>Personal Planner Dashboard</h1>
        <div style={{"display": "flex", "justifyContent": "space-between", "alignItems": "center"}}>
            <p style={{"color": "#666"}}>Manage your daily tasks and schedule.</p>
            <div style={{"display": "flex", "gap": "0.5rem"}}>
                <button
                    onClick={getAiBriefing}
                    style={{"padding": "0.5rem 1rem", "backgroundColor": "#8A2BE2", "color": "white", "border": "none", "borderRadius": "4px", "cursor": "pointer"}}
                >
                    AI Morning Briefing
                </button>
                <button
                    onClick={getHabitAdvice}
                    style={{"padding": "0.5rem 1rem", "backgroundColor": "#FF8C00", "color": "white", "border": "none", "borderRadius": "4px", "cursor": "pointer"}}
                >
                    Habit Coach
                </button>
            </div>
        </div>

        <div style={{"margin": "1rem 0", "padding": "1rem", "backgroundColor": "#F3E5F5", "borderLeft": "4px solid #8A2BE2", "borderRadius": "4px"}}>
            <h4 style={{"margin": "0 0 0.5rem 0", "color": "#4A148C"}}>AI Assistant Says:</h4>
            <p style={{"margin": "0", "whiteSpace": "pre-wrap"}}>{ai_response}</p>
        </div>

        <form
            onSubmit={postTask}
            style={{"display": "flex", "flexDirection": "column", "gap": "1rem", "marginBottom": "2rem", "padding": "1rem", "backgroundColor": "#f9f9f9", "borderRadius": "8px"}}
        >
            <h3>Add New Task</h3>
            <input
                type="text"
                value={title}
                onChange={lambda (e: ChangeEvent) { title = e.target.value; }}
                placeholder="Task Title"
                style={{"padding": "0.6rem", "border": "1px solid #ddd", "borderRadius": "6px"}}
            />
            <input
                type="text"
                value={desc}
                onChange={lambda (e: ChangeEvent) { desc = e.target.value; }}
                placeholder="Description"
                style={{"padding": "0.6rem", "border": "1px solid #ddd", "borderRadius": "6px"}}
            />
            <select
                value={priority}
                onChange={lambda (e: ChangeEvent) { priority = e.target.value; }}
                style={{"padding": "0.6rem", "border": "1px solid #ddd", "borderRadius": "6px"}}
            >
                <option value="high">High</option>
                <option value="medium">Medium</option>
                <option value="low">Low</option>
            </select>
            <button
                type="submit"
                style={{"padding": "0.8rem", "backgroundColor": "#4CAF50", "color": "white", "border": "none", "borderRadius": "6px", "cursor": "pointer", "fontWeight": "bold"}}
            >
                Add Task
            </button>
        </form>

        <h2>Your Tasks</h2>
        <div style={{"display": "flex", "flexDirection": "column", "gap": "1rem"}}>
            {[
                <TaskCard key={idx} title={t.title} description={t.description} status={t.status} priority={t.priority}/>
                for (idx, t) in enumerate(tasks)
            ]}
        </div>
    </div>
}
