"""planner - Client-Side UI."""

import from endpoints { TaskNode, AddTask, ListTasks }

def:pub app -> JsxElement {
    has tasks: list[TaskNode] = [],
        title: str = "",
        desc: str = "",
        priority: str = "medium";

    # Load existing tasks once, when the component first mounts.
    can with entry {
        loadTasks();
    }

    async def loadTasks -> None;
    async def postTask(e: FormEvent) -> None;

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
        <p style={{"color": "#666"}}>Manage your daily tasks and schedule.</p>
        
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
                <div key={idx} style={{"padding": "1rem", "border": "1px solid #ddd", "borderRadius": "8px", "borderLeft": "5px solid " + (t.priority == "high" ? "#ff4d4f" : t.priority == "medium" ? "#faad14" : "#52c41a")}}>
                    <h3 style={{"margin": "0 0 0.5rem 0"}}>{t.title}</h3>
                    <p style={{"margin": "0", "color": "#555"}}>{t.description}</p>
                    <div style={{"marginTop": "0.5rem", "fontSize": "0.85rem", "color": "#888", "display": "flex", "justifyContent": "space-between"}}>
                        <span>Status: <b>{t.status}</b></span>
                        <span style={{"textTransform": "uppercase"}}>{t.priority} Priority</span>
                    </div>
                </div>
                for (idx, t) in enumerate(tasks)
            ]}
            {
                tasks.length == 0 ? <p style={{"color": "#999", "fontStyle": "italic"}}>No tasks found. Add a task to get started!</p> : null
            }
        </div>
    </div>
}
