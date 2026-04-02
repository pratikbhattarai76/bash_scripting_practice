#!/bin/bash

#Variables
LOG_DIR="/home/pratik/devops/bash_scripting_practice/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
REPORT_FILE="/home/pratik/devops/bash_scripting_practice/logs_report/log_analysis_report.txt"

echo "Analysing Log Files" > "$REPORT_FILE"
echo "===================================================================" >> "$REPORT_FILE"

# Array Variable
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo -e "\nList of log files updated in last 24 hours" >> "$REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"


for LOG_FILE in $LOG_FILES; do

    echo -e "\n" >> "$REPORT_FILE"
    echo "===================================================================">> "$REPORT_FILE"
    echo "$LOG_FILE" >> "$REPORT_FILE"
    echo "===================================================================">> "$REPORT_FILE"

    for PATTERN in ${ERROR_PATTERNS[@]}; do


        echo -e "\nsearching $PATTERN logs $LOG_FILE file" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "\nNumber of $PATTERN logs found in $LOG_FILE" >> "$REPORT_FILE"
        grep -c "$PATTERN" "$LOG_FILE">> "$REPORT_FILE"

    done
done

echo -e "\nLog analysis completed and report is saved in $REPORT_FILE \n"