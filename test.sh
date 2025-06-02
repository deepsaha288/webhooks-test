#server log genarate
#!/bin/bash
# Check if the log file exists, if not create it
LOG_FILE="server.log"
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi
# Generate a random number of log entries
NUM_ENTRIES=$((RANDOM % 100 + 1))  # Random number between 1 and 100
# Generate log entries
for ((i = 1; i <= NUM_ENTRIES; i++)); do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    MESSAGE="Log entry number $i"
    echo "$TIMESTAMP - $MESSAGE" >> "$LOG_FILE"
done
# Display the generated log entries
echo "Generated $NUM_ENTRIES log entries in $LOG_FILE:"
cat "$LOG_FILE"
# Clean up the log file if needed
# Uncomment the next line to remove the log file after displaying its contents
# rm "$LOG_FILE"
# End of script
# Note: This script generates a log file named "server.log" in the current directory.
# You can modify the script to change the log file name or location as needed.
# To run this script, save it as test.sh and execute it in a terminal with:
# chmod +x test.sh
# ./test.sh     