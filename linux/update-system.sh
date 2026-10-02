#!/usr/bin/env bash
# ====================================
# Shell-script updating your system
# ====================================
# Compatible: deb based systems using apt, especially Ubuntu
# Author: chstrick (c) 2026
# License: MIT License
# ====================================

set -euo pipefail

# ============ ANSI COLORS ===========
readonly C_RESET='\033[0m'
readonly C_BOLD='\033[1m'
readonly C_RED='\033[38;5;196m'
readonly C_ORANGE='\033[38;5;208m'
readonly C_WHITE='\033[1;37m'

# ============ LOGGING FUNCTIONS ============
log() {
    echo -e "$1"
}

log_ln() {
    echo ""
}

log_bold() {
    echo -e "${C_BOLD}$1${C_RESET}"
}

log_step() {
    echo -e "${C_ORANGE}▸${C_RESET} ${C_WHITE}$1${C_RESET}"
}

log_error() {
    echo -e "${C_RED}✘ $1${C_RESET}"
}

# ============ CHECK ROOT RIGHTS ===========
if [[ $EUID -ne 0 ]]; then
    log_ln
    log_error "Please run this script with root rights! Use: sudo $0"
    log_ln
    exit 1
fi

# ============ UPDATE SYSTEM ===========
log_ln
log_bold "╔══════════════════════╗"
log_bold "║ UPDATE UBUNTU SCRIPT ║"
log_bold "╚══════════════════════╝"
log_ln
log_step "Current OS: $(cat /etc/os-release | sed '1!d' | cut -d "\"" -f 2)"
log_ln
log_step "apt update ..."
sudo apt update -qq
log_ln
log_step "apt uprade ..."
sudo apt upgrade -y -qq
log_ln
log_step "apt autoremove --purge ..."
sudo apt autoremove --purge -y -qq
log_ln
log_step "apt autoclean ..."
sudo apt autoclean
log "Sources cleaned"
log_ln
log "${C_BOLD}You may have to reboot the system. Use: sudo reboot.${C_RESET}"
log_ln
