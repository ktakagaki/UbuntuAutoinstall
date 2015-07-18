#!/bin/sh
LIST_OF_APPS="chromium-browser vlc openshot openshot-doc gimp gimp-data gimp-plugin-registry gimp-data-extras unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract \
file-roller ubuntu-restricted-extras dconf-tools powertop htop compizconfig-settings-manager deluge smplayer shutter cheese gtk2-engines-equinox faenza-icon-theme equinox-theme"

# Enable sources, add PPAs and update sources: 
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

apt-get update
apt-get upgrade -y
apt-get install -y aptitude
aptitude update
aptitude -y safe-upgrade

apt-get update
apt-get -y upgrade

add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:openshot.developers/ppa
add-apt-repository -y ppa:lyx-devel/release

apt-get update


apt-get install -y oracle-java8-installer
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

apt-get install -y lyx

# restart nautilus (req. to activate elementary):
nautilus -q

aptitude install -y $LIST_OF_APPS

