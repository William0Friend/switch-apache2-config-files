#!/bin/bash
#This script will prompt the user to select a configuration from the CONFIGS array. It will disable all other configurations and enable the selected one. It will then restart Apache2 for the changes to take effect.

#Remember to replace "default", "config1", and "config2" with the actual names of your config files. Also, make sure to give execution permissions to the script file by running chmod +x scriptname.sh.

#Please keep in mind that using this kind of scripts can disrupt service availability if misused, ensure that you understand the implications of the script and modify it to meet your needs. Always test scripts in a non-production environment before using them in a production setting.

# List of your Apache config files without the .conf extension
CONFIGS=("default" "config1" "config2")

# Prompt the user to choose a configuration
echo "Please select a configuration:"
select CONFIG in "${CONFIGS[@]}"; do
    if [[ -n $CONFIG ]]; then
        break
    else
        echo "Invalid selection."
    fi
done

# Switch to the selected configuration
for i in "${CONFIGS[@]}"; do
    if [[ $i == $CONFIG ]]; then
        echo "Enabling $CONFIG.conf..."
        sudo a2ensite "$CONFIG.conf"
    else
        echo "Disabling $i.conf..."
        sudo a2dissite "$i.conf"
    fi
done

# Restart Apache2 to apply the changes
echo "Restarting Apache2..."
sudo systemctl restart apache2

# Confirm the operation
echo "Switched to $CONFIG configuration."
