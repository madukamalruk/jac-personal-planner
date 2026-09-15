"""planner - Command Line Interface.

An interactive terminal menu for quick task entry and viewing.
"""

import:py from builtins { input, print }
import from endpoints { AddTask, ListTasks }

walker cli_app {
    can run with Root entry {
        while True {
            print("\n===============================");
            print("   Personal Planner CLI");
            print("===============================");
            print("1. Add a new Task");
            print("2. View all Tasks");
            print("3. Exit");
            
            choice = input("Select an option (1-3): ");
            
            if choice == "1" {
                title = input("Enter Task Title: ");
                desc = input("Enter Task Description: ");
                priority = input("Enter Priority (High/Medium/Low): ");
                
                if not title {
                    print("Task title cannot be empty!");
                    continue;
                }
                
                spawn here ++> AddTask(title=title, description=desc, priority=priority);
                print("\n[SUCCESS] Task added to your planner!");
            } elif choice == "2" {
                tasks = spawn here ++> ListTasks();
                print("\n--- Your Tasks ---");
                if not tasks.reports {
                    print("No tasks found. Add some tasks first!");
                } else {
                    for t in tasks.reports {
                        print(f"-> {t.title} [{t.priority}] (Status: {t.status})");
                    }
                }
            } elif choice == "3" {
                print("Exiting CLI. Have a productive day!");
                break;
            } else {
                print("Invalid choice. Please enter 1, 2, or 3.");
            }
        }
    }
}

with entry {
    spawn root ++> cli_app();
}
