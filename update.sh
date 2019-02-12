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
This saves the axe.conf file intact so genkey should not change"
delay 10

#Remove old binaries
sudo rm /usr/bin/axe*
cd ~
cd ./axecore
#sudo rm -R chainstate blocks backups
#sudo rm w* s* p* n* m* i* g* f* d* d* b*
sudo rm mncache*

echo -e "Downloading and installing new AXECORE Binaries"
#Download new Binaries
 cd ~
wget https://github.com/AXErunners/axe/releases/download/v1.2.1/axecore-1.2.1-x86_64-linux-gnu.tar.gz
tar -xzf axecore-1.2.1-x86_64-linux-gnu.tar.gz -C ~/AXE-MN-setup
rm -rf axecore-1.2.1-x86_64-linux-gnu.tar.gz
 
 # Deploy binaries to /usr/bin
 sudo rm ~/AXE-MN-setup/axecore-1.2.1/bin/axe-qt
 sudo rm ~/AXE-MN-setup/axecore-1.2.1/bin/test*
 sudo cp ~/AXE-MN-setup/axecore-1.2.1/bin/axe* /usr/bin/
 sudo chmod 755 -R ~/AXE-MN-setup
 sudo chmod 755 /usr/bin/axe*
 
 echo -e "Starting Axe Core 1.2.0"
  #Starting daemon first time just to generate masternode private key
    axed -daemon
    #axed -reindex -daemon
echo -ne '[##                 ] (15%)\r'
sleep 6
echo -ne '[######             ] (30%)\r'
sleep 9
echo -ne '[########           ] (45%)\r'
sleep 6
echo -ne '[############       ] (67%)\r'
sleep 9
echo -ne '[################   ] (72%)\r'
sleep 10
echo -ne '[###################] (100%)\r'
echo -ne '\n'


echo -e "Update Complete !!
You may have to reactivate in wallet. Let sync complete and check local wallet!!
"
delay 30
# Run axemon.sh
axemon.sh

