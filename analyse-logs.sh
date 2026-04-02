#!/bin/bash

LOG_DIR="/home/pratik/devops/bash_scripting_practice/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
echo "Analysing Log Files"
echo "==================="

echo -e "\nList of log files updated in last 24 hours"
find $LOG_DIR -name "*.log" -mtime -1

echo -e "\nsearching ERROR logs in application.log file"
grep "ERROR" "$LOG_DIR/$APP_LOG_FILE" 

echo -e "\nNumber of ERROR logs found in application.log"
grep -c "ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in system.log"
grep -c "FATAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of CRITICAL logd found in system.log"
grep -c "CRITICAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nCritical logs in system.log file"
grep "CRITICAL" "$LOG_DIR/$SYS_LOG_FILE"
