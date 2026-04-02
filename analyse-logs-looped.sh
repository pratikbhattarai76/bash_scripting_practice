#!/bin/bash

#Variables
LOG_DIR="/home/pratik/devops/bash_scripting_practice/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

# Array Variable
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "Analysing Log Files"
echo "-------------------"

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES"


for LOG_FILE in $LOG_FILES; do
    echo -e "\nsearching ${ERROR_PATTERNS[0]} logs $LOG_FILE file"
    grep ${ERROR_PATTERNS[0]} "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[0]}logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[1]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo -e "\nNumber of ${ERROR_PATTERNS[2]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[2]}" "$LOG_FILE"

    echo -e "\n${ERROR_PATTERNS[2]} logs in $LOG_FILE file"
    grep "${ERROR_PATTERNS[2]}" "$LOG_FILE"
done