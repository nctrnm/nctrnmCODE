#!/bin/bash

# Matthew McGilvery - 2024-09-22
# Custom Aliases for Termux

# Description:
# This script sets up a collection of useful aliases and functions
# for enhancing the Termux terminal experience. It includes shortcuts
# for file management, system monitoring, Git operations, networking, and Termux-specific utilities.
# Additionally, a Git synchronization process has been added for automated syncing.

# Version: 1.4

# --- General navigation and file management --- 

alias bed='nano ~/.bashrc && source ~/.bashrc && ls -l /sdcard/Documents > /sdcard/Documents/aliases_$(date +"%m%d%Y").txt && cp ~/.bashrc ~/.bash_profile && cp ~/.bashrc /sdcard/Documents/code/sh/n.bashrc.sh && source ~/.bashrc'
alias i='apt-get install'
alias c='clear'
alias gem='termux-open https://gemini.google.com'
alias h='history'
alias py='python'
alias la='ls -a'
alias copy='termux-clipboard-set'
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd ~'
alias sdcard='cd /sdcard'
alias op='termux-open'
alias ggl="op https://enrypted.google.com/search?q=$*"

# New aliases inspired by existing ones
alias dl='cd ~/Downloads'         # Go to Downloads directory
alias dc='cd ~/Documents'         # Go to Documents directory
alias desk='cd ~/Desktop'         # Go to Desktop directory (if available)
alias edit='nano'                  # Quick nano editor access
alias mkdir='mkdir -p'            # Create directories recursively
alias rm='rm -i'                   # Interactive remove (confirm before deleting)
alias mv='mv -i'                   # Interactive move (confirm before overwriting)
alias cp='cp -i'                   # Interactive copy (confirm before overwriting)
alias df='df -h'                   # Disk usage with human-readable sizes
alias du='du -sh *'                # Disk usage summary of current directory

# --- Package management and system updates --- 

alias update='apt-get update && apt-get upgrade'
alias remove='apt-get remove'
alias search='apt-cache search'

# New aliases
alias upgrade='apt-get upgrade'    # Separate upgrade alias
alias list='apt list --installed'   # List installed packages
alias clean='apt-get autoclean'    # Clean up unused packages

# --- Networking --- 

alias myip='curl ifconfig.me'
alias ping='ping -c 4'             # Ping with 4 packets
alias speedtest='speedtest-cli'    # Run speedtest (if installed)

# --- Git shortcuts ---

alias repo='cd /sdcard/Documents/code/'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'

# New Git aliases
alias gd='git diff'                # View changes
alias glog='git log --oneline'     # Concise log
alias gco='git checkout'            # Checkout branch/commit

# --- Git sync process --- 
#!/bin/bash

# Matthew McGilvery - 2024-09-10
# Custom Aliases for Termux

# Description:
# This script sets up a collection of useful aliases and functions
# for enhancing the Termux terminal experience. It includes shortcuts
# for file management, system monitoring, Git operations, networking, and Termux-specific utilities.
# Additionally, a Git synchronization process has been added for automated syncing.

# Version: 1.3

# --- General navigation and file management --- 

alias bed='nano ~/.bashrc && source ~/.bashrc && ls -l /sdcard/Documents > /sdcard/Documents/aliases_$(date +"%m%d%Y").txt && cp ~/.bashrc ~/.bash_profile && cp ~/.bashrc /sdcard/Documents/code/sh/n.bashrc.sh && bash'
alias i='apt-get install'
alias c='clear'
alias gem='termux-open https://gemini.google.com'
alias h='history'
alias py='python'
alias la='ls -a'
alias copy='termux-clipboard-set'
alias ll='ls -alF'
alias ..='cd ..'
alias ...='cd ../..'
alias home='cd ~'
alias sdcard='cd /sdcard'
alias op='termux-open'
alias ggl="op https://enrypted.google.com/search?q=$*"

# --- Package management and system updates --- 

alias update='apt-get update && apt-get upgrade'
alias remove='apt-get remove'
alias search='apt-cache search'

# --- Networking --- 

alias myip='curl ifconfig.me'

# --- Git shortcuts ---

alias repo='cd /sdcard/Documents/code/'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'

# --- Git sync process: Automating Git updates, adds, commits, and pushes --- 

git_sync() {
    # Navigate to the GitHub repository directory
    cd /sdcard/Documents/code/ || { 
        echo "Error: Directory not found." >&2  # Redirect error message to stderr
        return 1
    }

    echo "Starting Git sync process..."

    # Pull the latest changes from the remote repository
    git pull || { 
        echo "Error: Failed to pull latest changes." >&2
        return 1
    }

    # Add all changes to the staging area
    git add . || {
        echo "Error: Failed to add changes." >&2
        return 1
    }

    # Get list of added, modified, and deleted files
    local added_files=$(git diff --cached --name-only --diff-filter=A)
    local modified_files=$(git diff --cached --name-only --diff-filter=M)
    local deleted_files=$(git diff --cached --name-only --diff-filter=D)

    # Check for changes and create custom commit messages
    if [ -n "$added_files" ]; then
        # Files added
        local commit_msg="a: $(date +"%Y-%m-%d %H:%M:%S") Added files: $added_files"
    elif [ -n "$modified_files" ]; then
        # Files updated
        local commit_msg="u: $(date +"%Y-%m-%d %H:%M:%S") Updated files: $modified_files"
    elif [ -n "$deleted_files" ]; then
        # Files deleted
        local commit_msg="r: $(date +"%Y-%m-%d %H:%M:%S") Removed files: $deleted_files"
    else
        # No changes detected
        echo "No changes to commit."
        return 0
    fi

    # Commit the changes with the corresponding message
    git commit -m "$commit_msg" || {
        echo "Error: Failed to commit changes." >&2
        return 1
    }

    # Push changes to the remote repository
    git push || {
        echo "Error: Failed to push changes." >&2
        return 1
    }

    echo "Git sync completed successfully."
}

# Alias to run the git_sync function
alias sync_git='git_sync'

# Run `sync_git` in your terminal to sync your repository automatically and go to home directory
git_sync && cd /sdcard/

# Alias to run the git_sync function
alias sync_git='git_sync'

# Run `sync_git` in your terminal to sync your repository automatically and go to home directory
git_sync && cd /sdcard/
