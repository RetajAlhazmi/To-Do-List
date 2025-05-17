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
echo "Small steps, big wins — Let’s get started."
# Main program loop - Rana
while true; 
do
echo ""  # Print an empty line for spacing and better readability 
echo "Choose an action:"  # Display menu prompt
echo "1) Add a task"      # Option 1: Call add_task function
echo "2) View tasks"      # Option 2: Call view_tasks function
echo "3) Complete a task" # Option 3: Call complete_task function
echo "4) Show number of tasks"   # Option 4: Call count_tasks function
echo "5) Show current date and time" # Option 5: Call show_date_time
echo "0) Exit"            # Option 0: Exit the script

read choice               # Read the user's input (menu selection)

# Use a case statement to handle different user choices
case $choice in
    1) add_task ;;        # If the user enters 1, call the add_task function
    2) view_tasks ;;      # If 2, call the view_tasks function
    3) complete_task ;;   # If 3, call the complete_task function
    4) count_tasks ;;     # If 4, call the count_tasks function
    5) show_date_time ;;  # If 5, call the show_date_time function
    0) echo "Goodbye!"; exit ;;  # If 0, print goodbye and exit the loop/script
    *) echo "Invalid choice." ;; # For any other input, show an error message
   esac
done
