#!/bin/bash

#To run multiple processes without their output interrupting the script, you can use the screen command. screen creates a virtual terminal that can be detached and reattached, allowing processes to continue running even after the original terminal session is closed.

#Here's an example of how you can use screen to run multiple processes in the background:

#screen -dmS firefox firefox
#screen -dmS code code-insiders
#screen -dmS chrome google-chrome

    #screen -dmS session_name command: This creates a detached screen session with the given session_name and runs the specified command within that session. Each process is started in its own screen session.
    #firefox, code-insiders, google-chrome: These are the commands to start the respective applications.
#for virtual terminal, i.e. screen usage
screen -dmS github github
screen -dmS firefox firefox
screen -dmS code code-insiders /home/william0friend/gits/abuseipdbwilliam0friend
cd /home/william0friend/gits/abuseipdbwilliam0friend 
php artisan serve 
wait
