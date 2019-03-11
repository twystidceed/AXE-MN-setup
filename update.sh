#!/bin/bash

 
#Delay script execution for N seconds
function delay { echo -e "${GREEN}Sleep for $1 seconds...${NC}"; sleep "$1"; }

#Stop daemon if it's already running
function stop_daemon {
    if pgrep -x 'axed' > /dev/null; then
        echo -e "${YELLOW}Attempting to stop axed${NC}"
        axe-cli stop
        delay 30
        if pgrep -x 'axe' > /dev/null; then
            echo -e "${RED}axed daemon is still running!${NC} \a"
            echo -e "${RED}Attempting to kill...${NC}"
            pkill axed
            delay 30
            if pgrep -x 'axed' > /dev/null; then
                echo -e "${RED}Can't stop axed! Reboot and try again...${NC} \a"
                exit 2
            fi
        fi
    fi
}

stop_daemon
echo -e "Removing old data 
delay 10

#Remove old binaries
sudo rm /usr/bin/axe*
sudo rm /usr/local/bin/axe*
sudo rm ~/AXE-MN-setup
sudo rm -rf .axecore
delay 10

echo -e "Downloading install script and installing fresh masternode"
delay 3
echo -e "This will require you to enter your masternode private key AND the new BLS keys to complete"
delay 5
echo -e "getting updates before install"
sudo apt-get -y update
sudo git clone https://github.com/twystidceed/AXE-MN-setup.git && cd AXE-MN-setup && bash axe-setup-swap.sh


