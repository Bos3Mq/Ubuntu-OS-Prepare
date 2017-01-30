#!/bin/bash

#=====================================#
#= This script was written by Bos3Mq =#
#=====================================#                                                                           
#==========   __________ ============#
#==========  |           \  ==========# 
#==========  |      _     | ==========#
#==========  |     '  |   | ==========#
#==========  |         _ / ===========#
#==========  |            \  =========#
#==========  |      _      | =========#
#==========  |     '  |    | =========#
#==========  |             | =========#
#==========  |____________/  =========#
#=====================================#
#      https://github.com/Bos3Mq      #
#=====================================#


echo " 
 =========================
 ||  Ubuntu OS Prepare  ||
 =========================
"
echo "[*]This script can install a variety of popular packages, add
   the official ubuntu repositories and create a backup of the 
   Home directory. Before running this script we will now ensure 
   that the following points are checked, if not this script will
   auto exit;
"
sleep 7s

echo "[1] That this script was executed as Root...
"
sleep 2s
if [ "$(id -u)" != "0" ]; then
   echo "-This script must be run as root!!

[*]Please use the 'Sudo' command and try again.
" 1>&2
exit
 
else sleep 2s

echo "-Check!
"
fi

echo "[2] That you have an internet connection...
" 
sleep 2s
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "-Check!

[*]Now proceeding to run the script..."
else
    echo "[*]Offline"

        echo "[*]exiting..."
        sleep 3s
        exit
fi


sleep 5s

clear

## Creating A Backup Of The "Home" Directory ##
##===========================================##

echo "[*]To avoid any possible unwanted changes later, we first create a backup
   of the home directory. This script is intended to be executed on a  
   freshly installed system, if you intend to run it on an already existing
   system this next step can take some time due to any files amounted there. 
"
read -p "[*]Would you like to skip this step? [y/n] :" prompt


if [[ $prompt == "n" || $prompt == "N" || $prompt == "No" || $prompt == "no" ]];
then
        echo "[*]Begging backup of the Home directory now...
"
        tar -cvpzf /home/OSP-Backup.tar.gz /home/

        echo "
[*]A backup of your Home directory has now been created and placed in your Home folder.
"

else [[ $prompt == "y" || $prompt == "Y" || $prompt == "Yes" || $prompt == "yes" ]];
 
      echo "[*]Now skipping backup process and proceeding to the addition of repositories...
"

fi

sleep 3s


## Adding Official Ubuntu Repositories ##
##=====================================##


echo "[*]This step adds the official Ubuntu Main, Security and Update respositories
   with respect to your version of Ubuntu. If you have already added these repositories
   yourself then it is recommended that you skip this step. If you are unsure of what
   repositories you already have configured, you can check by opening the file located
   in /etc/apt/sources.list and checking beforehand.
" 


read -p "[*]Would you like to skip this step? [y/n] :" resp

if [[ $resp == "n" || $resp == "N" || $resp == "No" || $resp == "no" ]];
then
        echo "[*]Adding repositories now...
"


echo "[*]First we need to check your distribution version and architecture."
sleep 3s
OS=$(lsb_release -si)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)


echo "
*/Operating System - $OS
*/Version - $VER
*/Architecture - $ARCH bit
"

echo "[*]Now we add official Ubuntu repositories :"
sleep 3s
apt-get clean

if [ $VER = 12.04 ];

then 
     echo "
#==================================#
# Repositories added by OS Prepare #
#==================================#


###### Ubuntu Main Repos
deb http://us.archive.ubuntu.com/ubuntu/ precise main 
deb-src http://us.archive.ubuntu.com/ubuntu/ precise main 

###### Ubuntu Update Repos
deb http://us.archive.ubuntu.com/ubuntu/ precise-security main 
deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main 
deb-src http://us.archive.ubuntu.com/ubuntu/ precise-security main 
deb-src http://us.archive.ubuntu.com/ubuntu/ precise-updates main 
 " | sudo tee -a /etc/apt/sources.list
fi


if [ $VER = 14.04 ];

then 
     echo "
#==================================#
# Repositories added by OS Prepare #
#==================================#


###### Ubuntu Main Repos
deb http://us.archive.ubuntu.com/ubuntu/ trusty main 
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty main 

###### Ubuntu Update Repos
deb http://us.archive.ubuntu.com/ubuntu/ trusty-security main 
deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main 
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-security main 
deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main 
 " | sudo tee -a /etc/apt/sources.list
fi


if [ $VER = 16.04 ];

then 
     echo "
#==================================#
# Repositories added by OS Prepare #
#==================================#


###### Ubuntu Main Repos
deb http://us.archive.ubuntu.com/ubuntu/ xenial main 
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main 

###### Ubuntu Update Repos
deb http://us.archive.ubuntu.com/ubuntu/ xenial-security main 
deb http://us.archive.ubuntu.com/ubuntu/ xenial-updates main 
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-security main 
deb-src http://us.archive.ubuntu.com/ubuntu/ xenial-updates main
 " | sudo tee -a /etc/apt/sources.list

fi


if [ $VER = 16.10 ];

then 
     echo "
#==================================#
# Repositories added by OS Prepare #
#==================================#


###### Ubuntu Main Repos
deb http://us.archive.ubuntu.com/ubuntu/ yakkety main 
deb-src http://us.archive.ubuntu.com/ubuntu/ yakkety main 

###### Ubuntu Update Repos
deb http://us.archive.ubuntu.com/ubuntu/ yakkety-security main 
deb http://us.archive.ubuntu.com/ubuntu/ yakkety-updates main 
deb-src http://us.archive.ubuntu.com/ubuntu/ yakkety-security main 
deb-src http://us.archive.ubuntu.com/ubuntu/ yakkety-updates main 
 " | sudo tee -a /etc/apt/sources.list
fi

sleep 3s


echo "
[*]Repositories added, now we run an update and then we install some top rated software...
" 
sleep 3s


else [[ $resp == "y" || $resp == "Y" || $resp == "Yes" || $resp == "yes" ]];
 
      echo "
[*]Now skipping the addition of repositories, updating and proceeding 
   to the installation of software...
"
fi
apt-get update

clear

## Adding Popular Apps ##
##=====================##


echo "[*]Please select which packages you would like to install :
   ========================================================

[a]-- Gedit          [b]-- VLC         [c]-- Gimp  

[d]-- Wicd           [e]-- Filezilla   [f]-- Leafpad

[g]-- Teamviewer     [h]-- Skype       [i]-- Wine

[j]-- Sublime Text   [k]-- Dropbox     [l]-- Irssi

[m]-- Steam          [n]-- Pidgin      [o]-- Thunderbird 

"

read -p "[*]Type the letters of the packages you would like to install
   separated by commas. e.g [a,h,l,o] :" ans

if [[ $ans == *"a"* ]];
  then  

echo "
[*]Installing Gedit
"

apt-get install gedit --yes --force-yes
sleep 2s

fi

if [[ $ans == *"b"* ]];
  then  

echo "
[*]Installing Vlc
"
apt-get install vlc --yes --force-yes
sleep 2s

fi

if [[ $ans == *"c"* ]];
  then  

echo "
[*]Installing Gimp
"
apt-get install gimp --yes --force-yes
sleep 2s

fi


if [[ $ans == *"d"* ]];
  then  

echo "
[*]Installing Wicd
"
apt-get install wicd --yes --force-yes
sleep 2s

fi

if [[ $ans == *"e"* ]];
  then

echo "
[*]Installing Filezilla
"
apt-get install filezilla --yes --force-yes
sleep 2s

fi

if [[ $ans == *"f"* ]];
  then

echo "
[*]Installing Leafpad
"
apt-get install leafpad --yes --force-yes
sleep 2s

fi

if [[ $ans == *"g"* ]];
  then

echo "
[*]Installing Teamviewer
"
wget https://downloadeu8.teamviewer.com/download/version_12x/teamviewer_12.0.71510_i386.deb
dpkg --add-architecture i386
apt-get update
apt-get install -f
dpkg -i teamviewer_12.0.71510_i386.deb
sleep 2s

fi

if [[ $ans == *"h"* ]];
  then

echo "
[*]Installing Skype
"
wget https://repo.skype.com/latest/skypeforlinux-64-alpha.deb
dpkg -i skypeforlinux-64-alpha.deb
sleep 2s

fi

if [[ $ans == *"i"* ]];
  then  

echo "
[*]Installing Wine
"
apt-get install wine --yes --force-yes
sleep 2s

fi

if [[ $ans == *"j"* ]];
  then

echo "
[*]Installing Sublime Text
"
add-apt-repository ppa:webupd8team/sublime-text-3
apt-get update
apt-get install sublime-text-installer --yes --force-yes
sleep 2s

fi

if [[ $ans == *"k"* ]];
  then

echo "
[*]Installing Dropbox
"
apt-get install dropbox --yes --force-yes
sleep 2s

fi

if [[ $ans == *"l"* ]];
  then

echo "
[*]Installing Irssi
"
apt-get install irssi --yes --force-yes
sleep 2s

fi

if [[ $ans == *"m"* ]];
  then

echo "
[*]Installing Steam
"
apt-get install steam --yes --force-yes
sleep 2s

fi

if [[ $ans == *"n"* ]];
  then

echo "
[*]Installing Pidgin
"
apt-get install pidgin --yes --force-yes
sleep 2s

fi


if [[ $ans == *"o"* ]];
  then

echo "
[*]Installing Thunderbird 
"
apt-get install thunderbird --yes --force-yes
sleep 2s

fi

echo "
[*]Running a final update after installing new packages...
"

apt-get update

echo "
[*]Package installation process complete. The selected software
   has been installed. Clearing terminal...
"
sleep 5s
clear



##  Script Completed  ##
##====================##




echo "[*]The setup process is now complete. To review all changes
   created by this script you can; check your /home folder for a file
   named OSP-Backup.tar.gz if you chose to created one, review your 
   /etc/apt/sources.list file for official repositories added, and
   your applications list for the installations you selected earlier.



   Feel free to enjoy your newly setup Ubuntu distribution and follow
   me on Github at https://github.com/Bos3Mq for more scripts to come!



                              ~ Bos3Mq ~
"


sleep 7s

exit

