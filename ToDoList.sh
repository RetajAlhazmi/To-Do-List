#!/bin/bash

# Task files - Retaj
PENDING_FILE="pending_tasks.txt" # Assign pending_tasks.txt to PENDING_FILE variable (incompleted tasks)
COMPLETED_FILE="completed_tasks.txt" # Assign completed_tasks.txt to COMPLETED_FILE variable (completed tasks)

# 1.Add a new task - Retaj
add_task() {
echo "Enter task name: " # Ask the user to input task name
read task_name # Take task name input from the user
echo "Enter due date (YYYY-MM-DD): " # Ask the user to input due date
read due_date # Take due date input from the user
echo "$task_name-$due_date" >> "$PENDING_FILE" # Put task name and due date variables into pending tasks file
echo "Task added!" # Confirmation message
git add "$PENDING_FILE" # Stage the updated task file for git version control
git commit -m "Added task: $task_name" # Commit the change with a message that includes the task name
}

# 2.View tasks sorted by due date - Retaj
view_tasks() {
if [ -s "$PENDING_FILE" ]; then # Check if the pending tasks file is not empty
echo "Current pending tasks (sorted by due date): " # Display header text
sort -t '-' -k2 "$PENDING_FILE" # Sort tasks by date and print them
else
echo "No pending tasks available." # Inform the user if the file is empty
fi
}

# 3.Complete a task (move from pending to complete) - Huda
complete_task() {

}

# 4.Show number of tasks - Jood
count_tasks() {

}

# 5.Show current date and time -Jood
show_date_time() {

}

# Show welcome message - Rana

# Main program loop - Rana


