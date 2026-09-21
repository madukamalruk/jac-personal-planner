"""planner - Entry Point.

Combines server-side endpoints with the client-side UI.
"""

import from endpoints { TaskNode, AddTask, ListTasks }

# Client-side UI

import from .frontend { app as ClientApp }

def:pub app -> JsxElement {
    <ClientApp/>
}
