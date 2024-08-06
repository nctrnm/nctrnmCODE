# Matthew McGilvery, 2024-07-07, Enhanced Termux Aliases

#!/bin/bash

# Custom Aliases for Efficient Termux Usage

# General Navigation and File Management
alias bed='nano ~/.bashrc && source ~/.bashrc && ls -l /sdcard/Documents > /sdcard/Documents/aliases_$(date +"%m%d%Y").txt' # Edit and reload .bashrc, create directory text file
alias i='apt-get install' # Install packages efficiently
alias c='clear' # Clear the terminal screen for better visibility
alias h='history' # Show command history for easy reference
alias la='ls -a' # List all files including hidden ones
alias ll='ls -alF' # Long list format with hidden files and types for detailed view
alias ..='cd ..' # Navigate up one directory
alias ...='cd ../..' # Navigate up two directories
alias home='cd ~' # Go to home directory quickly
alias sdcard='cd /sdcard' # Access sdcard directory swiftly

# Package Management and System Updates
alias update='apt-get update && apt-get upgrade' # Update and upgrade packages for optimal performance
alias install='apt-get install' # Install packages seamlessly
alias remove='apt-get remove' # Remove unwanted packages
alias search='apt-cache search' # Search for packages easily

# Networking
alias myip='curl ifconfig.me' # Get public IP address quickly

# Git Shortcuts
alias gs='git status' # Show git status efficiently
alias ga='git add .' # Add all changes to git repository
alias gc='git commit -m' # Commit with a message
alias gp='git push' # Push changes to remote repository
alias gl='git pull' # Pull changes from remote repository
alias gb='git branch' # List branches for easy navigation

# Custom Utility
alias mkd='mkdir -p' # Create directories recursively
alias grep='grep --color=auto' # Colorful grep for better readability
alias man2pdf='bash /sdcard/Documents/code/sh/man2pdf.sh' # Convert man pages to PDF

# Additional Alias for Fast Navigation
alias docs='cd ~/Documents' # Go to Documents directory
alias dls='cd ~/Downloads' # Go to Downloads directory
alias gitdir='cd /sdcard/Documents/code' # Navigate to Git directory quickly

# Termux-Specific Shortcuts
alias notify='termux-notification --title "Notification" --content' # Send a notification with content
alias batt='termux-battery-status' # Show battery status instantly
alias photo='termux-camera-photo -c 0 /sdcard/photo.jpg' # Take a photo with the camera
alias clipget='termux-clipboard-get' # Get clipboard content easily
alias clipset='termux-clipboard-set' # Set clipboard content quickly
alias wifi='termux-wifi-connectioninfo' # Show WiFi connection information
alias sensor='termux-sensor -s' # Get sensor data (e.g., accelerometer, light)
alias vibrate='termux-vibrate' # Vibrate the device

# New Aliases
alias pkgs='pkg list-all' # List all available packages
alias tinfo='termux-info' # Show Termux information
alias wake='termux-wake-lock' # Prevent device from sleeping
alias sleep='termux-wake-unlock' # Allow device to sleep
alias open='termux-open' # Open a file or URL with an app
alias volup='termux-volume music 15' # Set volume to maximum
alias voldown='termux-volume music 0' # Mute volume
alias mkgif='ffmpeg -f image2 -i img%d.jpg -vf fps=10 output.gif' # Create a gif from images
alias cpuinfo='lscpu' # Display CPU information
alias meminfo='free -h' # Display memory information
alias termux-setup='termux-setup-storage' # Setup storage access for Termux
alias update-all='pkg update && pkg upgrade' # Update and upgrade all packages for optimal performance
alias space='df -h' # Show disk space usage
alias killall='killall -9' # Force kill a process by name
alias down='termux-download' # Download a file
alias rand='echo $RANDOM' # Generate a random number
alias zip='zip -r' # Create a zip file
alias unzip='unzip' # Extract a zip file
alias mkfile='touch' # Create an empty file
alias rmdir='rm -r' # Remove a directory
alias chmodx='chmod +x' # Make a file executable

# Additional Termux-Specific Aliases
alias termux-sms-inbox='termux-sms-list -l 5' # List last 5 SMS messages
alias termux-sms-send='termux-sms-send -n' # Send an SMS message
alias termux-telephony-deviceinfo='termux-telephony-deviceinfo' # Get telephony device info
alias termux-telephony-call='termux-telephony-call' # Make a phone call
alias termux-fingerprint='termux-fingerprint' # Use fingerprint authentication
alias termux-share='termux-share' # Share a file or URL
alias termux-torch='termux-torch on' # Turn on flashlight
alias termux-torch-off='termux-torch off' # Turn off flashlight
alias termux-notification-remove='termux-notification-remove' # Remove a notification

# Reload the .bashrc file to apply the aliases
cd /sdcard && clear && whiptail --msgbox "You can do it." 13 21 && tty-clock -Sc update-all
