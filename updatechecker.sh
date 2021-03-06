#!/bin/bash 
# This will check for updates and then send and email letting the user know if there is updates

if  sudo apt update | grep "packages can be upgraded." ;then
	mkdir -p ~/code
	echo ""Subject: OS Upgrades Found on echo $USER"'s" node - Please review"" > ~/code/upgradeable_apps.txt
	apt list --upgradable -v >>  ~/code/upgradeable_apps.txt 2>&1
	sed -i.bak '3,2d;5d'  ~/code/upgradeable_apps.txt
	sendmail "Add-email-here-without-quotes" <  ~/code/upgradeable_apps.txt
fi
