#!/bin/bash

echo "Analysing Log Files"
echo "==================="

echo "List of log files updated in last 24 hours"
find . -name "*.log" -mtime -1

echo "searching ERROR logs in application.log file"
grep "ERROR" logs/application.log

echo "Number of ERROR logs found in application.log"
grep -c "ERROR" logs/application.log

echo "Number of FATAL logs found in application.log"
grep -c "FATAL" logs/application.log

echo "Number of FATAL logs found in system.log"
grep -c "FATAL" logs/system.log

echo "Number of CRITICAL logd found in system.log"
grep -c "CRITICAL" logs/system.log

echo "Critical logs in system.log file"
grep "CRITICAL" logs/system.log
