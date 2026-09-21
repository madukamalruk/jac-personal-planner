"""planner - Mobile Home Screen."""

import from endpoints { TaskNode, AddTask, ListTasks }
import from agents { ReflectionAgent }

def:pub Home -> JsxElement {
    has tasks: list[TaskNode] = [],
        briefing: str = "Loading your morning briefing...",
        showQuickAdd: bool = False,
        showFullForm: bool = False,
        newTaskTitle: str = "",
        newTaskPriority: str = "medium";

    can with entry {
        # Fetch tasks
        result = root spawn ListTasks();
        tasks = result.reports;
        
        # Fetch AI Briefing
        reflection_result = root spawn ReflectionAgent(time_of_day="morning");
        briefing = reflection_result.briefing;
    }

    <div style={{"padding": "20px", "fontFamily": "system-ui"}}>
        <h1>Good Morning!</h1>
        <div style={{"backgroundColor": "#e3f2fd", "padding": "15px", "borderRadius": "10px", "marginBottom": "20px"}}>
            <h3>AI Briefing 🤖</h3>
            <p>{briefing}</p>
        </div>

        <h2>Today's Schedule</h2>
        {[
            <div key={idx} style={{"padding": "10px", "borderBottom": "1px solid #eee"}}>
                <b>{t.title}</b> - <span style={{"color": "#888"}}>{t.priority}</span>
            </div>
            for (idx, t) in enumerate(tasks)
        ]}

        {/* Quick Add FAB */}
        <button 
            onClick={lambda (e: Event) { showQuickAdd = True; }}
            style={{"position": "fixed", "bottom": "20px", "right": "20px", "borderRadius": "50%", "width": "60px", "height": "60px", "fontSize": "30px", "backgroundColor": "#4CAF50", "color": "white", "border": "none"}}
        >
            +
        </button>

        {/* Quick Add Modal */}
        {showQuickAdd ? 
            <div style={{"position": "fixed", "bottom": "0", "left": "0", "width": "100%", "backgroundColor": "white", "padding": "20px", "boxShadow": "0 -2px 10px rgba(0,0,0,0.1)"}}>
                <h3>Quick Add Task</h3>
                <div style={{"display": "flex", "alignItems": "center", "gap": "10px"}}>
                    <input type="text" placeholder="Task name..." value={newTaskTitle} style={{"flex": "1", "padding": "10px"}} />
                    <button style={{"padding": "10px", "backgroundColor": "#2196F3", "color": "white", "border": "none", "borderRadius": "50%"}}>🎤</button>
                </div>
                <div style={{"marginTop": "10px", "display": "flex", "justifyContent": "space-between"}}>
                    <button onClick={lambda (e: Event) { showFullForm = True; }} style={{"background": "none", "border": "none", "color": "#2196F3"}}>More options...</button>
                    <button onClick={lambda (e: Event) { showQuickAdd = False; }} style={{"padding": "10px", "backgroundColor": "#4CAF50", "color": "white", "border": "none"}}>Save</button>
                </div>
            </div>
        : null}
    </div>
}
