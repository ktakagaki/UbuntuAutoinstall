##### Table of Contents  
[Installation](#Installation-of-Archlinux-on-Lenovo-Ideapad-S12)  
[Emphasis](#Booting-the-installation-medium)  
[Lists](#Partition-layout)
[LinkLabel](#Select-a-mirror)  
[LinkLabel](#Generate-a-fstab)  
[LinkLabel](#Chroot-and-configure-the-base-system)  
[LinkLabel](#Title)  

# Installation of Archlinux on Lenovo Ideapad S12 #

## Booting the installation medium ##
- loadkyes dk-latin1
- loadkeys uk
- lspci -k shows BCM4312 082.11/b LP-PHY. Kernel driver in use: b43-pci-bridge. Kernel modules: ssb
- enp2s0
- Identify the storage devices with lsblk

**Commands used for partitioning /dev/sda**
- parted /dev/sda
- mkpart ESP fat32 1MiB 513MiB
- set 1 boot on
- mkpart primary ext4 513MiB 20.5GiB
- mkpart primary linux-swap 20.5GiB 24.5GiB
- mkpart primary ext4 24.5GiB 100%
- quit


### Partition layout ###
| sda 	| size     	| filetype 	| mount point 	|
|-----	|----------	|----------	|-------------	|
| 1   	| 512 MiB  	| fat32    	| EFI boot    	|
| 2   	| 21.5 GiB 	| ext4     	| /           	|
| 3   	| 4295 MiB 	| swap     	| swap        	|
| 4   	| 134 GiB  	| ext4     	| /home       	|


**It is unknown to me right now if I have to format the entire harddrive as fat32/vfat32 before partitioning as I have created a new GPT partition table with the #gdisk -o command. this may cause the installation to be unbootable after chrooting**. The wiki states
> **Warning:** If a new UEFI system partition has been created on a UEFI/GPT system, it must be formatted with a fat32 or vfat32 file system. Failure to do so will result in an unbootable installation [Generate an fstab](https://wiki.archlinux.org/index.php/Beginners%27_guide#Generate_an_fstab)

- lsblk /dev/sda
- mkfs.vfat -F32 /dev/sda1
- mkfs.ext4 /dev/sda2
- mkswap /dev/sda3
- swapon /dev/sda3
- mkfs.ext4 /dev/sda4
- **Mount the root partition to the /mnt directory**
- mount /dev/sda2 /mnt
- mkdir -p /mnt/home
- mount /dev/sda4 /mnt/home
- For the EFI boot partition I choose the simple [EFISTUB](https://wiki.archlinux.org/index.php/EFISTUB) solution from the archwiki
- **mkdir -p /mnt/boot**
- **mount /dev/sda1 mnt/boot**


### Select a mirror ###
- nano /etc/pacman.d/mirrorlist
- CTRL-K to cut and CTRL-U to paste
- pacstrap -i /mnt base base-devel (Did not use the -i switch, this should cause pacstrap to install every package from the base group without prompting)

### Generate a fstab ###












**Wifi drivers under /usr/lib/firmware on the Live environment must be explicetly installed to provide functionality after rebooting.**


## Chroot and configure the base system ##