#!/bin/bash

# ====== CONFIG SETTINGS ======
CPU_THRESHOLD=80        # percent
MEMORY_THRESHOLD=75     # percent
CHECK_INTERVAL=300      # seconds (5 minutes)

EMAIL_FROM="your_email@gmail.com"
EMAIL_TO="ankitmahato768@gmail.com"
EMAIL_SUBJECT="Server Alert: High Usage"
LOG_FILE="server_monitor.log"

# ====== FUNCTION: Send Email ======
send_email() {
    local subject="$1"
        local body="$2"

            echo -e "$body" | mail -s "$subject" "$EMAIL_TO"
                if [ $? -eq 0 ]; then
                        echo "$(date): Email alert sent." >> "$LOG_FILE"
                            else
                                    echo "$(date): Email sending failed." >> "$LOG_FILE"
                                        fi
                                        }

                                        # ====== FUNCTION: Check System Resources ======
                                        check_system_resources() {
                                            # Get CPU usage (average over 1 second)
                                                CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')  # 100 - idle
                                                    CPU=${CPU%.*}  # remove decimal

                                                        # Get Memory usage percentage
                                                            MEMORY=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
                                                                MEMORY=${MEMORY%.*}

                                                                    echo "$(date): CPU: ${CPU}%, Memory: ${MEMORY}%" >> "$LOG_FILE"

                                                                        # Check thresholds
                                                                            if [ "$CPU" -gt "$CPU_THRESHOLD" ] || [ "$MEMORY" -gt "$MEMORY_THRESHOLD" ]; then
                                                                                    BODY="High resource usage detected!\n\nCPU Usage: ${CPU}% (Limit: ${CPU_THRESHOLD}%)\nMemory Usage: ${MEMORY}% (Limit: ${MEMORY_THRESHOLD}%)"
                                                                                            send_email "$EMAIL_SUBJECT" "$BODY"
                                                                                                fi
                                                                                                }

                                                                                                # ====== MAIN LOOP ======
                                                                                                echo "$(date): Monitoring started." >> "$LOG_FILE"

                                                                                                while true; do
                                                                                                    check_system_resources
                                                                                                        sleep "$CHECK_INTERVAL"
                                                                                                        done