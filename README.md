# UbuntuAutoinstall
Bash script for automatic installation of most commonly used programs on my Ubuntu virtual machines

When installing a new virtual machine with Ubuntu it usually takes some time to manually install all of the programs I need on the machine. This simple script is intended to automate this process.

After the first restart when Ubuntu has been installed on the virtual machine, install git and clone this repository to somewhere on the computer. From there the script can be executed 
```{bash}
$git clone https://github.com/slentzen/UbuntuAutoinstall.git
$cd UbuntuAutoinstall
$sudo sh ./UbuntuAutoinstall
```
NB: Script has only been developed for personal use, so use at your own risk, and only on a virtual machine where catastrophic failures can be tolerated.


###List of programs installed
* Lyx from PPA
* GIMP
* VLC player
* Chromium browser
* ...

###Features to be added eventually
* Modifying /etc/rc.local for automatic mounting of shared folders
* Automatic Git clone of repositories with config files for .bashrc and other programs