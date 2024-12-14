#!/bin/bash
sudo -v
handle_interrupt() {
  notify-send "Update interrupted" "The system update was stopped by Ctrl+C."
  exit 1
}

trap handle_interrupt SIGINT

if command -v apt-get &>/dev/null; then #Debian-based
  sudo spt-get update && sudo apt-get upgrade -y
elif command -v yum &>/dev/null; then 
  sudo yum update -y 
elif command -v pacman &>//dev/null; then #Arch-based
  sudo pacman -Syu --noconfirm 
elif command -v dnf &>/dev/null; then #RHEL based
  sudo dnf upgrade -y
elif command -v zypper &>/dev/null; then #openSUSE
  sudo zypper update --non-interactive
elif command -v apk &>/dev/null; then #Alpine Linux
  sudo apk update && sudo apk upgrade --no-interactive 
elif command emerge &>/dev/null; then #Gentoo based
  sudo emerge --sync && sudo emerge -uDN @world --ask=n 
elif command -v slackpkg &>/dev/null; then #Slackware
  sudo sudo slackpkg upgrade-all -batch
elif command -v eopkg &>/dev/null; then #Solus
  sudo eopkg up --assumeyes
elif command -v xbps &>/dev/null; then #Void Linux
  sudo xbps-install -Syu -y 
else
  notify-send echo "Package Manager not found\n Please add them to the /usr/bin/auto-update"
  exit 1
fi 

notify-send echo "System Updated successfully.\n You may now reboot for the changes."
