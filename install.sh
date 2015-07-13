#!/bin/bash

# This script is a huge rip off of EyeWitness
# Thanks! https://github.com/ChrisTruncer/EyeWitness
# Global Variables
userid=`id -u`
osinfo=`cat /etc/issue|cut -d" " -f1|head -n1`
eplpkg='http://linux.mirrors.es.net/fedora-epel/6/i386/epel-release-6-8.noarch.rpm'

# Clear Terminal (For Prettyness)
clear

# Print Title
echo '#######################################################################'
echo '#                             BoNeSi Setup                            #'
echo '#######################################################################'
echo

# Check to make sure you are root!
# Thanks to @themightyshiv for helping to get a decent setup script out
if [ "${userid}" != '0' ]; then
  echo '[Error]: You must run this setup script with root privileges.'
  echo
  exit 1
fi

# OS Specific Installation Statement
case ${osinfo} in
  # Kali Dependency Installation
  Kali)
    apt-get update
    echo '[*] Installing Kali Dependencies'
    apt-get install -y libpcap-dev libnet-dev autoconf gcc make automake git
    echo
    echo '[*] Installing BoNeSi'
    git clone https://github.com/Markus-Go/bonesi.git /opt/BoNeSi
    cd /opt/BoNeSi
    autoreconf
    ./configure
    make
    make install
    rm -rf !\(50k-bots|browserlist.txt|urllist.txt\)
    cd
  ;;
  # CentOS 6.5 Dependency Installation
  CentOS)
    # echo '[Warning]: BoNeSi on CentOS Requires EPEL Repository!'
    # read -p '[?] Install and Enable EPEL Repository? (y/n): ' epel
    # if [ "${epel}" == 'y' ]; then
      # rpm -ivh ${eplpkg}
    # else
      # echo '[!] User Aborted EyeWitness Installation.'
      # exit 1
    # fi
    echo '[*] Installing CentOS Dependencies'
    yum install -y libpcap-devel libnet-devel autoconf gcc make automake git
    echo
    echo '[*] Installing BoNeSi'
    git clone https://github.com/Markus-Go/bonesi.git /opt/BoNeSi
    cd /opt/BoNeSi
    autoreconf
    ./configure
    make
    make install
    mv /opt/BoNeSi/50k-bots /tmp/50k-bots
    mv /opt/BoNeSi/browserlist.txt /tmp/browserlist.txt
    mv /opt/BoNeSi/urllist.txt /tmp/urllist.txt
    rm -rf /opt/BoNeSi
    mkdir /opt/BoNeSi
    mv /tmp/50k-bots /opt/BoNeSi/50k-bots
    mv /tmp/browserlist.txt /opt/BoNeSi/browserlist.txt
    mv /tmp/urllist.txt /opt/BoNeSi/urllist.txt
    cd
  ;;
  ;;
  # CentOS 7
  \\S)
    # echo '[Warning]: BoNeSi on CentOS Requires EPEL Repository!'
    # read -p '[?] Install and Enable EPEL Repository? (y/n): ' epel
    # if [ "${epel}" == 'y' ]; then
      # rpm -ivh ${eplpkg}
    # else
      # echo '[!] User Aborted EyeWitness Installation.'
      # exit 1
    # fi
    echo '[*] Installing CentOS Dependencies'
    yum install -y libpcap-devel libnet-devel autoconf gcc make automake git
    echo
    echo '[*] Installing BoNeSi'
    git clone https://github.com/Markus-Go/bonesi.git /opt/BoNeSi
    cd /opt/BoNeSi
    autoreconf
    ./configure
    make
    make install
    mv /opt/BoNeSi/50k-bots /tmp/50k-bots
    mv /opt/BoNeSi/browserlist.txt /tmp/browserlist.txt
    mv /opt/BoNeSi/urllist.txt /tmp/urllist.txt
    rm -rf /opt/BoNeSi
    mkdir /opt/BoNeSi
    mv /tmp/50k-bots /opt/BoNeSi/50k-bots
    mv /tmp/browserlist.txt /opt/BoNeSi/browserlist.txt
    mv /tmp/urllist.txt /opt/BoNeSi/urllist.txt
    cd
  ;;
  # Notify Manual Installation Requirement And Exit
  *)
    echo "[Error]: ${osinfo} is not supported by this setup script."
    echo
    exit 1
esac

# Finish Message
echo '[*] Setup script completed successfully, enjoy BoNeSi! :)'
echo
