#!/bin/bash

# ========================================
# Server Health Check Script
# Author: Shubham | DevOps Learning Journey
# ========================================

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="health_report_$(date '+%Y%m%d_%H%M%S').log"

echo "========================================" | tee $LOG_FILE
echo "  SERVER HEALTH REPORT" | tee -a $LOG_FILE
echo "  Generated: $TIMESTAMP" | tee -a $LOG_FILE
echo "========================================" | tee -a $LOG_FILE

# --- DISK USAGE ---
echo "" | tee -a $LOG_FILE
echo "DISK USAGE:" | tee -a $LOG_FILE
df -h | tee -a $LOG_FILE

DISK_ALERT=$(df -h | awk 'NR>1 {gsub(/%/,"",$5); if ($5 > 80) print "WARNING: "$6" is "$5"% full"}')
if [ -n "$DISK_ALERT" ]; then
  echo "$DISK_ALERT" | tee -a $LOG_FILE
fi

# --- MEMORY USAGE ---
echo "" | tee -a $LOG_FILE
echo "MEMORY USAGE (MB):" | tee -a $LOG_FILE
free -m | tee -a $LOG_FILE

# --- TOP 5 CPU PROCESSES ---
echo "" | tee -a $LOG_FILE
echo "TOP 5 CPU-CONSUMING PROCESSES:" | tee -a $LOG_FILE
ps aux --sort=-%cpu | head -6 | tee -a $LOG_FILE

# --- NETWORK CHECK ---
echo "" | tee -a $LOG_FILE
echo "NETWORK CONNECTIVITY:" | tee -a $LOG_FILE
ping -c 2 google.com | tail -2 | tee -a $LOG_FILE

echo "" | tee -a $LOG_FILE
# --- UPTIME ---
echo "" | tee -a $LOG_FILE
echo "SYSTEM UPTIME:" | tee -a $LOG_FILE
uptime | tee -a $LOG_FILE
echo "Report saved to: $LOG_FILE" | tee -a $LOG_FILE
