#!/bin/bash

# This script is a huge rip off of EyeWitness
# Thanks! https://github.com/ChrisTruncer/EyeWitness
# Global Variables
userid=`id -u`
osinfo=`cat /etc/issue|cut -d" " -f1|head -n1`

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
    apt-get install -y libpcap-dev libnet-dev autoconf gcc make automake
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
  # Notify Manual Installation Requirement And Exit
  *)
    echo "[Error]: ${osinfo} is not supported by this setup script."
    echo
    exit 1
esac

# Finish Message
echo '[*] Setup script completed successfully, enjoy BoNeSi! :)'
echo
