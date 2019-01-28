# AXE-MN-setup
<br>
<li>sudo apt-get update
<li>sudo apt-get install git
<br><br>
<li> If you need the script to make a node <b> WITH SWAP</b> Use this line to install
<li> This is typical usage with VULTR and Digital Ocean 
<li>Copy the entire line below and paste into your ssh session or vps terminal
<li>git clone https://github.com/twystidceed/AXE-MN-setup.git && cd AXE-MN-setup && bash axe-setup-swap.sh
<br><br>
<li> For installation on VPS with preset swap use this line - <b>This does NOT install Swap</b> 
<li> This is typical for more specialized nodes for advanced users
<li>Copy the entire line below and paste into your ssh session or vps terminal
<li>git clone https://github.com/twystidceed/AXE-MN-setup.git && cd AXE-MN-setup && bash axe-setup-noswap.sh
<br><br>
  <br>
<li><b>***not working *** IF YOU ARE ALREADY USING MY SCRIPT AND ONLY NEED TO UPDATE TO NEW VERSION 1.2.0</b>
<li>sudo rm -R AXE-MN-setup && git clone https://github.com/twystidceed/AXE-MN-setup.git && cd AXE-MN-setup && bash update.sh

