#!/bin/bash
#    The disown command to detach a process from the current shell, allowing it to continue running even after the shell session is closed. 
#    Each command to start a process (firefox, code-insiders, google-chrome) is followed by >/dev/null 2>&1 & to redirect both the standard output and error streams to /dev/null, effectively discarding any output.
#    After each command, & is used to run the process in the background.
#    The disown command is used immediately after each process is started to detach it from the shell.
# Run firefox in the background
firefox >/dev/null 2>&1 &
disown


# Run Github Desktop in the background
github >/dev/null 2>&1 &
disown

# Run code-insiders in the background
code-insiders /home/william0friend/gits/abuseipdbwilliam0friend >/dev/null 2>&1 &
disown

## Run firefox in a private window
firefox --private-window >/dev/null 2>&1 &
disown

cd /home/william0friend/gits/abuseipdbwilliam0friend 
php artisan serve 
wait
