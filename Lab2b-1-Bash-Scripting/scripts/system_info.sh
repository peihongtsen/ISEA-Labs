#!/bin/bash
echo "System Information Script"
echo "Current User: $(whoami)"
for i in {1..5}
do
    echo "Iteration: $i"
    sleep 1s
done
read -p "Enter a number between 1 and 10: " number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Invalid input: Please enter a numeric value."
    exit 1
fi
if [ "$number" -le 5 ]; then
    echo "You entered a number less than or equal to 5."
elif [ "$number" -le 10 ]; then
    echo "You entered a number greater than 5 but less than or equal to 10."
else
    echo "Number out of range."
fi
