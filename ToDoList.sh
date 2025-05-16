#!/bin/bash

# Task files
PENDING_FILE="pending_tasks.txt"
COMPLETED_FILE="completed_tasks.txt"

# Add a new task
add_task() {
echo "Enter task name: "
read task_name
echo "Enter due date (YYYY-MM-DD): "
read due_date
echo "$task_name-$due_date" >> "$PENDING_FILE"
echo "Task added!"
git add "$PENDING_FILE"
git commit -m "Added task: $task_name"
}

# View tasks sorted by due date
view_tasks() {
if [ -s "$PENDING_FILE" ]; then
echo "Current pending tasks (sorted by due date): "
sort -t '-' -k2 "$PENDING_FILE"
else
echo "No pending tasks available."
fi
}


