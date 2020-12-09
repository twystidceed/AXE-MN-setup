# AXE-MN-setup UBUNTU 18.04 ONLY!! V1.6.1.1 DIP003 enabled
<br>
<li>sudo apt-get update
<li>sudo apt-get install git
<br><br>
<br><br>
<li>Copy the entire line below and paste into your ssh session or vps terminal
<li>git clone https://github.com/twystidceed/AXE-MN-setup.git && cd AXE-MN-setup && bash axe-setup-noswap.sh
<br><br>
<li><b> Anyone using my script can update their node quickly by using the following line. </b>
<li> Just copy and paste the line below - this will update your existing files and restart the daemon on 1.4.1
<li>cd AXE-MN-setup && git fetch --all && git reset --hard origin/master && bash update.sh
