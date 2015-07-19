##### Table of Contents  
[Headers](#headers)  
[Emphasis](#emphasis)  
[Lists](#lists)  


# Installation of Archlinux on Lenovo Ideapad S12 #

## Booting the installation medium ##
- loadkyes dk-latin1
- loadkeys uk
- lspci -k shows BCM4312 082.11/b LP-PHY. Kernel driver in use: b43-pci-bridge. Kernel modules: ssb
- enp2s0
- Identify the storage devices with lsblk

Used the following partitioning scheme using gdisk on /dev/sda
- parted /dev/sda
- mkpart ESP fat32 1MiB 513MiB
- set 1 boot on
- mkpart primary ext4 513MiB 20.5GiB
- mkpart primary linux-swap 20.5GiB 24.5GiB
- mkpart primary ext4 24.5GiB 100%
- quit

The resulting partition layout is then


| sda 	| size     	| filetype 	| mount point 	|
|-----	|----------	|----------	|-------------	|
| 1   	| 512 MiB  	| fat32    	| EFI boot    	|
| 2   	| 21.5 GiB 	| ext4     	| /           	|
| 3   	| 4295 MiB 	| swap     	| swap        	|
| 4   	| 134 GiB  	| ext4     	| /home       	|







-  mkfs.ext2 /dev/sda2 mkfs.ext4 /dev/sda4 
-  mkswap /dev/sda3 && swapon /dev/sda3 
-  mount /dev/sda4 /mnt mkdir /mnt/boot mount /dev/sda2 /mnt/boot 


**Wifi drivers under /usr/lib/firmware on the Live environment must be explicetly installed to provide functionality after rebooting.**


## Chroot and configure the base system ##