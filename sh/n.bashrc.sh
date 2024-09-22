#!/bin/bash
# Matthew McGilvery - 2024-09-10
# Custom Aliases for Termux
# 
# Description:
# This script sets up a collection of useful aliases and functions
# for enhancing the Termux terminal experience. It includes shortcuts
# for file management, system monitoring, Git operations, networking, and Termux-specific utilities.
# Additionally, a Git synchronization process has been added for automated syncing.
#
# Version: 1.2

# General navigation and file management
alias bed='nano ~/.bashrc && source ~/.bashrc && ls -l /sdcard/Documents > /sdcard/Documents/aliases_$(date +"%m%d%Y").txt && cp ~/.bashrc ~/.bash_profile && cp ~/.bashrc /sdcard/Documents/code/sh/n.bashrc.sh' # Edit and reload .bashrc, create directory text file, copy to repository
alias i='apt-get install' # Install packages
alias c='clear' # Clear the terminal screen
alias gem='termux-open https://gemini.google.com' #Opem Google Gemininin web browser
alias h='history' # Show command history
alias py='python' # Run python
alias la='ls -a' # List all files including hidden
alias copy='termux-clipboard-set' # Copy to clipboard
alias ll='ls -alF' # Long list format with hidden files and types
alias ..='cd ..' # Go up one directory
alias ...='cd ../..' # Go up two directories
alias home='cd ~' # Go to home directory
alias sdcard='cd /sdcard' # Go to sdcard directory
alias op='termux-open'
alias ggl="op https://enrypted.google.com/search?q=$*" #Limits Google search results to 8
# Package management and system updates
alias update='apt-get update && apt-get upgrade' # Update and upgrade packages
alias i='apt-get install' # Install packages
alias remove='apt-get remove' # Remove packages
alias search='apt-cache search' # Search for packages

# Networking
alias myip='curl ifconfig.me' # Get public IP address

# Git shortcuts
alias repo='cd /sdcard/Documents/code/' # Go to GitHub Repo
alias gs='git status' # Show git status
alias ga='git add .' # Add all changes to git
alias gc='git commit -m' # Commit with message
alias gp='git push' # Push changes to remote
alias gl='git pull' # Pull changes from remote
alias gb='git branch' # List branches

# Git sync process: Automating Git updates, adds, commits, and pushes
git_sync() {
    # Navigate to the GitHub repository directory
    cd /sdcard/Documents/code/ || { echo "Directory not found"; return 1; }

    echo "Starting Git sync process..."

    # Pull the latest changes from the remote repository
    git pull
    if [ $? -ne 0 ]; then
        echo "Error pulling latest changes."
        return 1
    fi

    # Add all changes to the staging area
    git add .
    if [ $? -ne 0 ]; then
        echo "Error adding changes."
        return 1
    fi

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
    git commit -m "$commit_msg"
    if [ $? -ne 0 ]; then
        echo "Error committing changes."
        return 1
    fi

    # Push changes to the remote repository
    git push
    if [ $? -ne 0 ]; then
        echo "Error pushing changes."
        return 1
    fi

    echo "Git sync completed successfully."
}
# Alias to run the git_sync function
alias sync_git='git_sync'
# Run `sync_git` in your terminal to sync your repository automatically and go to home directory
git_sync && cd /sdcard/
