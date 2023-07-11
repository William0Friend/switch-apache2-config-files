#!/bin/bash
#This script will prompt the user to select a configuration from the CONFIGS array. It will back up the current httpd.conf file as httpd_backup.conf and then copy the selected configuration to httpd.conf.

#Remember to replace "httpd_alternate1.conf" and "httpd_alternate2.conf" with the actual names of your config files. Also, make sure to give execution permissions to the script file by running chmod +x scriptname.sh.

#After switching configurations, you would need to restart MAMP for the changes to take effect.

#Please note that switching configurations in this way can disrupt your MAMP services if done incorrectly. Always ensure you have backups of your configuration files and that you understand the changes you are making. As always, it is recommended to test any changes in a non-production environment before applying them in a production setting.
# Directory of your MAMP Apache configuration files
DIR="/Applications/MAMP/conf/apache/"

# List of your Apache config files
CONFIGS=("httpd.conf" "httpd_alternate1.conf" "httpd_alternate2.conf")

# Prompt the user to choose a configuration
echo "Please select a configuration:"
select CONFIG in "${CONFIGS[@]}"; do
    if [[ -n $CONFIG ]]; then
        break
    else
        echo "Invalid selection."
    fi
done

# Backup the current configuration
echo "Backing up the current configuration..."
cp "${DIR}httpd.conf" "${DIR}httpd_backup.conf"

# Switch to the selected configuration
echo "Switching to $CONFIG..."
cp "${DIR}${CONFIG}" "${DIR}httpd.conf"

# Confirm the operation
echo "Switched to $CONFIG configuration."
