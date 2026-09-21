"""planner - TaskCard Component."""

def:pub TaskCard(title: str, description: str, status: str, priority: str) -> JsxElement {
    <div style={{"padding": "1rem", "border": "1px solid #ddd", "borderRadius": "8px", "backgroundColor": "#fff"}}>
        <h3 style={{"margin": "0 0 0.5rem 0"}}>{title}</h3>
        <p style={{"margin": "0", "color": "#555"}}>{description}</p>
        <div style={{"marginTop": "0.5rem", "fontSize": "0.85rem", "color": "#888", "display": "flex", "justifyContent": "space-between"}}>
            <span>Status: <b>{status}</b></span>
            <span style={{"textTransform": "uppercase"}}>{priority} Priority</span>
        </div>
    </div>
}
