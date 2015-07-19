# Notes from using [AUI](https://github.com/helmuthdu/aui) to install on VirtualBox #

## Heading 2 ##

### First steps ###

- After boot, issue
- pacman -Sy git
- git clone git://github.com/helmuthdu/aui
- cd aui
- Type "./fifo"
- The UK keyboard is at "206"
- At partitioning scheme selection, choose "1" : default, then 1 again for **cfdisk**
- for "/dev/sda" select 1 again and then choose "dos"
- New, 7G (out of 8 available), Primary partition, Bootable
- Fill remaining 1G with New, 1G, Primary, go to "Type" and select "82" Linux swap
- Write to disk and Quit
- Set /dev/sda1 to be ext4

After the partitions have been written to the disk, install the base system. This will take a couple of minutes. Then start configuring the Fstab (Choose "6").

- Base Fstab on UUID
- **Review the Arch wiki on how to verify the UUID signatures generated in the Fstab file**
- For the hardware clock choose UTC
- The locale for en_GB is 74
- Install GRUB2 as the bootloader
- Use the automatic GRUB2 install
- Set root password and then type "d" when done

**Remember to remove the CD when rebooting**

### Booting into base system for the first time ###
Log in with the root credentials, changedir to ~/aui/ and execute ./lilo

- cd aui
- ./lilo
- For the .bashrc step, choose default "1"
- Choose "1" Yaourt as the AUR helper
- Choose **no** to "enable automatic mode"
- "1" for Basic setup and then "no" for adding repositories
- "yes" to install secure shell **SSH**
- **Possible issue / Conflict** If "Edit PKGBUILD ?" question is shown, answer no, when asked to build or install answer "yes"
- For rssh answer no to edit and yes to build and install
- **NFS** yes, install
- **Samba** yes, install
- **TLP** yes
- **Systemd** yes
- **Zram** yes
- **Fontconfig** 1 Default. Ignore warnings and proceed with installation
- CUPS, yes
- __**Install Additional Firmware**__ On a Live machine, this is where it is possible to install **WiFi**
- The AUI tutorial installs the *Cinnamon* Desktop Environment
- LightDM display manage, **3**
- After installing LightDM (option 3), tutorial enters "b" for Back|Skip to proceed to the next step of the installation
- 1, Install Icon themes, 
- 3, Numix Icons
- no edit, yes proceed with install
- I ~~Accidently edited Numix icon theme~~
- **Multiple parts of the numix theme installation was edited by accident**
- After installing the Numix theme, back at the "Gnome Icons" screen, select *b* to proceed to the next step
- GTK Themes, 2
- Numix, 2
- b, for Back|Skip to the **Cinnamon Themes** screen, then enter *d* for "Done"
- **Network Managers**
- 1, Networkmanager


#### Accessories Apps ####
Currently nothing noteworthy to install, Conky of interest only later on


#### Development Apps ####
22 Sublime Text, 19 Oracle JDK, 7 Geany, 5 Eclipse,

#### Remaining installation sections ####
Generally not that many things of interest to install on the VirtualBox as I play the music, write my articles and other things on the host system.
Section 9, Audio, remember to install the Codecs.

**Web Servers > 4 LEPP, NGINX, POSTGRESQL & PHP**

Eventually, all apps have been installed, remember to clean the orphaned packages and then quit and reboot the computer.


#### <center><ins>Clean Orphan Packages (15) After finishing installing all the apps</ins></center> ####