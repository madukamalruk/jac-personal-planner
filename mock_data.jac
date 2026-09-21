"""planner - Mock Data Generator for Testing.

Creates a realistic 'busy week' scenario to stress-test the AI Agents.
"""

import from endpoints { AddTask }

walker:priv SetupMockData {
    can setup with Root entry {
        # Task 1
        here spawn AddTask(
            title="Finish AI Masterclass Assignment", 
            description="Complete the backend walkers and frontend UI.", 
            due_date="Today 5:00 PM", 
            priority="high"
        );
        
        # Task 2 (Conflict with Task 1)
        here spawn AddTask(
            title="Team Meeting", 
            description="Discuss project architecture.", 
            due_date="Today 4:00 PM - 5:30 PM", 
            priority="high"
        );
        
        # Task 3
        here spawn AddTask(
            title="Grocery Shopping", 
            description="Buy milk, eggs, and bread.", 
            due_date="Today 6:00 PM", 
            priority="low"
        );
        
        # Task 4
        here spawn AddTask(
            title="Read Research Paper", 
            description="Read the latest Jac language documentation.", 
            due_date="Tomorrow 9:00 AM", 
            priority="medium"
        );
        
        report "Mock data (Busy Week) injected successfully!";
    }
}
