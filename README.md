# Ubuntu-OS-Prepare
                                  =======================
                                  || Ubuntu OS Prepare ||
                                  =======================

                                      - Version 1.0 -

                                         IMPORTANT

         Ubuntu OS Prepare was written solely for use on "Ubuntu" operating systems.
         It is not recommended to use it on any other OS such as Fedora, Redhat, etc...

         This script was written to support Ubuntu versions 12.04 to 16.10

         It is recommended to run this script from your /home folder after a fresh 
         install of Ubuntu, however there is no risk in running it on a pre-existing system.

         THIS SCRIPT REQUIRES AN INTERNET CONNECTION AND MUST BE RUN AS ROOT.

         This script can create a backup of your /home directory, however, backing up
         the /home directory does NOT protect your whole system from corruption later,
         it only backs up all files you have stored in that directory. Logically the more
         files you have in that directory, the longer it will take to create a backup.


         Package installation is mostly unattended, only some packages such as "Sublime Text"
         require minimal user input during the installation process.
      
         * The "Skype" package in this script is only for 64bit machines, it will not install
         on 32bit devices (Although I am working on fixing this soon).
  




ABOUT
-------------



1. What is this?
------------------

Ubuntu OS Prepare is bash a script I wrote to help Ubuntu
users quickly setup some basic features after a fresh install
of an Ubuntu system. It was written in a day, and is designed
to help new users aswell as experienced ones by eliminating
some of the need to perform all of these tasks manually.



2. What does it do?
--------------------

This script can do the following:

1) Create a backup of the /home directory

2) Add the official Ubuntu Main, Updates and Security repositories 

3) Install a variety of popular packages including;
    
   1  -- Gimp
   2  -- Gedit
   3  -- VLC
   4  -- Irssi
   5  -- Steam
   6  -- Skype*
   7  -- Teamviewer
   8  -- Wine
   9  -- Pidgin
  10  -- Leafpad
  11  -- Dropbox
  12  -- Thunderbird
  13  -- Sublime Text
  14  -- Filezilla
  15  -- Wicd


All of these steps are optional and users have the option to select
which of the above packages to install.



INSTRUCTIONS
------------                                           



To run the script simply navigate to the folder it's in from a terminal 
e.g. (If it's in your documents folder); 

$ cd Documents

And execute it by typing; 

$ sudo ./os-prepare.sh

If you recieve an error message after this then run the following command
and re-execute the script; 

$ chmod u+x os-prepare.sh





BUGS
------

This script is version 1.0, it has been tested on all supported Ubuntu versions
mentioned previously but not tested any any others such as 11.10 and lower. I am
positive that their will be bugs, I am not stating that this script is bulletproof
(it was written in one session) so please use it at your own discretion.

If you do find any bugs while using this script please report them to me so that I 
can fix them, or alternatively if you have any suggestions on how I can improve this
script feel free to let me know. You can reach me on my Github account at:

                              https://github.com/Bos3Mq



lICENSING
----------


This script is free to use and share, feel free to distribute it to as many people you wish,
however please do not remove any sections that credit the author. This script is opensource
and open to the public for modification. Please enjoy, share and give me some feedback any time.









                   
                                       ~ Bos3Mq ~ 
                                     




