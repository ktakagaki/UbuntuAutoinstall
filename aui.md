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
- 



#### Heading 4 ####

#### Heading 5 ####

#### Heading 6 ####

