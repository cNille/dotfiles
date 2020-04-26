#!/bin/bash

# Save current cronjobs
crontab -l > mycron

# Append new cronjob
echo "*/30 * * * * cd ~/dotfiles && ./update_configs.sh >> /tmp/configs_updater.log" >> mycron

# Install new cronjobs
crontab mycron

# Clean up
rm mycron
