#!/bin/bash
echo '    __    __                _                                       __  ';
echo '   / /_  / /__      __     (_)  __  __________     ____ ___________/ /_ ';
echo '  / __ \/ __/ | /| / /    / /  / / / / ___/ _ \   / __ `/ ___/ ___/ __ \';
echo ' / /_/ / /_ | |/ |/ /    / /  / /_/ (__  )  __/  / /_/ / /  / /__/ / / /';
echo '/_.___/\__/ |__/|__( )  /_/   \__,_/____/\___/   \__,_/_/   \___/_/ /_/ ';
echo '                   |/                                                   ';

uid=$(whoami | id -u)
echo -n "Welcome back, "
fgrep "$uid" /etc/passwd | awk -F: '{ print $5}'
echo -n "Current hostname: "
hostname
echo ""
echo -n "* The current system version is "
 grep PRETTY_NAME /etc/*release | cut -d "\"" -f 2
free -m | awk 'NR==2{printf "* Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "* Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
top -bn1 | grep load | awk '{printf "* CPU Load: %.2f\n", $(NF-2)}'

echo -n  "This system has been running for"
uptime -p | cut -c 3-99

echo ""
