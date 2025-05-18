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
if [ ! -s "$PENDING_FILE" ]; then        # Check if the pending tasks file is empty or doesn't exist
echo "No tasks to complete."
return
fi

echo "Pending tasks:"                                # Display the list of pending tasks
nl -w1 -s'. ' "$PENDING_FILE"                        # Number and list each pending task
echo "Enter task number to mark as complete:"        # Prompt the user to enter a task number
read task_number                                     # Read the task number from user input

if echo "$task_number" | grep -qE '^[0-9]+$'; then   # Check if input is a valid positive integer
 completed_line=$(sed -n "${task_number}p" "$PENDING_FILE")  # Get the task line from the file

if [ -z "$completed_line" ]; then                # Check if the task number is invalid
echo "Invalid task number."
return
fi
echo "$completed_line" >> "$COMPLETED_FILE"      # Add the completed task to the completed file
sed -i "${task_number}d" "$PENDING_FILE"         # Remove the task from the pending file

messages=(                                       # Define motivational messages array
"Great job! Keep up the awesome work! 💪"
"Well done! You're one step closer to success! 🚀"
"Task completed! You're doing amazing! 👏"
"Excellent work! Stay focused and keep pushing forward! ✅"
"Proud of your progress! Keep going strong! 🌟"
"Another task down! You're unstoppable! ✨"
"You're crushing it! Keep up the momentum! 💼"
"Success is built one task at a time — and you're doing it! 🏗️"
"Impressive! Keep showing up and getting it done! 🔥"
"Fantastic! You're building great habits! 🌈"
)
random_index=$((RANDOM % ${#messages[@]}))       # Pick a random index from the messages array
echo "Task completed! ${messages[$random_index]}" # Display the selected motivational message

git add "$PENDING_FILE" "$COMPLETED_FILE"        # Stage both updated files
git commit -m "Completed task: $completed_line"  # Commit with a message about the completed task
else
echo "Invalid number."                           # Handle invalid (non-numeric) input
    fi
} }

# 4.Show number of tasks - Jood
count_tasks() {
    pending_count=0 # Initial value for pending tasks counter
    completed_count=0 # Initial value for completed tasks counter

    if [ -f "$PENDING_FILE" ]; then # If the pending tasks file exists
        pending_count=$(wc -l < "$PENDING_FILE") # Count the number of lines in the file
    fi

    if [ -f "$COMPLETED_FILE" ]; then # If the completed tasks file exists
        completed_count=$(wc -l < "$COMPLETED_FILE") # Count the number of lines in the file
    fi

    echo "Pending tasks: $pending_count" # Print the number of pending tasks
    echo "Completed tasks: $completed_count" # Print the number of completed tasks
}

# 5.Show current date and time -Jood
show_date_time() {
echo "Current date and time: $(date)" # Print the current date and time using the shell command 'date'
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
