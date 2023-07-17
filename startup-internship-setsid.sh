#!/bin/bash

# Function to run a command in the background and detach it
run_in_background() {
    {
        "$@" >/dev/null 2>&1 &
        setsid "$@" >/dev/null 2>&1 < /dev/null &
    } >/dev/null 2>&1
}

# Function to create a background process group and detach it
create_background_group() {
    {
        "$@" >/dev/null 2>&1 &
        setsid "$@" >/dev/null 2>&1 < /dev/null &
    } >/dev/null 2>&1
}

# Run firefox in the background
create_background_group firefox

# Run Github Desktop in the background
create_background_group github

# Run code-insiders in the background
create_background_group code-insiders /home/william0friend/gits/abuseipdbwilliam0friend

## Run firefox in a private window
create_background_group firefox --private-window

cd /home/william0friend/gits/abuseipdbwilliam0friend 
php artisan serve
wait

