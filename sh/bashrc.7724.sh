# Matthew McGilvery, 2024-07-07, Termux Aliases Enhancement
#!/bin/bash
# Custom Aliases

# General navigation and file management
alias bed='nano ~/.bashrc && source ~/.bashrc && ls -l /sdcard/Documents > /sdcard/Documents/aliases_$(date +"%m%d%Y").txt'  # Edit and reload .bashrc, create directory text file
alias i='apt-get install'                  # Install packages
alias c='clear'                                 # Clear the terminal screen
alias h='history'                               # Show command history
alias la='ls -a'                                # List all files including hidden
alias ll='ls -alF'                              # Long list format with hidden files and types
alias ..='cd ..'                                # Go up one directory
alias ...='cd ../..'                            # Go up two directories
alias home='cd ~'                               # Go to home directory
alias sdcard='cd /sdcard'                       # Go to sdcard directory

# Package management and system updates
alias update='apt-get update && apt-get upgrade'  # Update and upgrade packages
alias install='apt-get install'                       # Install packages
alias remove='apt-get remove'                         # Remove packages
alias search='apt-cache search'                            # Search for packages

# Networking
alias myip='curl ifconfig.me'                   # Get public IP address

# Git shortcuts
alias gs='git status'                           # Show git status
alias ga='git add .'                            # Add all changes to git
alias gc='git commit -m'                        # Commit with message
alias gp='git push'                             # Push changes to remote
alias gl='git pull'                             # Pull changes from remote
alias gb='git branch'                           # List branches

# Custom utility
alias mkd='mkdir -p'                            # Create directories recursively
alias grep='grep --color=auto'                  # Colorful grep

# Additional alias for fast navigation
alias docs='cd ~/Documents'                     # Go to Documents directory
alias dls='cd ~/Downloads'                      # Go to Downloads directory

# Termux-specific shortcuts
alias notify='termux-notification --title "Notification" --content'  # Send a notification with content
alias batt='termux-battery-status'                                   # Show battery status
alias photo='termux-camera-photo -c 0 /sdcard/photo.jpg'             # Take a photo with the camera
alias clipget='termux-clipboard-get'                                 # Get clipboard content
alias clipset='termux-clipboard-set'                                 # Set clipboard content
alias wifi='termux-wifi-connectioninfo'                              # Show WiFi connection information
alias sensor='termux-sensor -s'                                      # Get sensor data (e.g., accelerometer, light)
alias vibrate='termux-vibrate'                                       # Vibrate the device

# New aliases
alias pkgs='pkg list-all'                                            # List all available packages
alias tinfo='termux-info'                                            # Show Termux information
alias wake='termux-wake-lock'                                        # Prevent device from sleeping
alias sleep='termux-wake-unlock'                                     # Allow device to sleep
alias open='termux-open'                                             # Open a file or URL with an app
alias volup='termux-volume music 15'                                 # Set volume to maximum
alias voldown='termux-volume music 0'                                # Mute volume
alias mkgif='ffmpeg -f image2 -i img%d.jpg -vf fps=10 output.gif'    # Create a gif from images
alias cpuinfo='lscpu'                                                # Display CPU information
alias meminfo='free -h'                                              # Display memory information
alias termux-setup='termux-setup-storage'                            # Setup storage access for Termux
alias update-all='pkg update && pkg upgrade'                         # Update and upgrade all packages
alias space='df -h'                                                  # Show disk space usage
alias killall='killall -9'                                           # Force kill a process by name
alias down='termux-download'                                         # Download a file
alias rand='echo $RANDOM'                                            # Generate a random number
alias zip='zip -r'                                                   # Create a zip file
alias unzip='unzip'                                                  # Extract a zip file
alias mkfile='touch'                                                 # Create an empty file
alias rmdir='rm -r'                                                  # Remove a directory
alias chmodx='chmod +x'                                              # Make a file executable

# Reload the .bashrc file to apply the aliases
clear && whiptail --msgbox  "You can do it." 13 21 && tty-clock -Sc
update-all
cd /sdcard/
