#!/bin/bash

# Script Name: login_attempts.sh
# Description: Extract login attempts, usernames, and errors from Linux auth logs

# 1. Set the path to the log file
LOGFILE="./sample_auth.log"

# 2. Check if the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Log file $LOGFILE does not exist!"
    exit 1
fi

# 3. Print header
echo "Login Attempts Summary:"
echo "------------------------"

# 4. Process the log file:
#    - grep for failed, invalid, success messages
#    - sed to clean sshd info
#    - awk to extract username and IP
grep -Ei "failed|invalid|success|accepted" "$LOGFILE" | \
sed -E 's/.*sshd\[.*\]: //g' | \
awk '
/Failed password/ {
    print "FAILED LOGIN - Username: " $9 ", IP Address: " $(NF-3)
}
/Invalid user/ {
    print "INVALID USER - Username: " $8 ", IP Address: " $(NF-3)
}
/Accepted password/ {
    print "SUCCESSFUL LOGIN - Username: " $9 ", IP Address: " $(NF-3)
}
'

# 5. Print footer
echo "------------------------"
echo "End of login attempts."
