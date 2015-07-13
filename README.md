# Install <abbr title="Bot Net Simulator">BoNeSi</abbr>
For Installing the BoNeSI DDoS Botnet Simulator on Kali 1.1.0a

Installs:
* libpcap-dev (Debian systems) or libpcap-devel (CentOS / RHEL systems)
* libnet-dev (Debian systems) or libnet-devel (CentOS / RHEL systems)
* autoconf
* automake
* gcc
* git
* make
* Installs https://github.com/Markus-Go/bonesi.git to `/opt/BoNeSi`

It then cleans up that directory leaving only:
* The `bin` command that was installed
* `/opt/BoNeSi/50k-bots`
* `/opt/BoNeSi/browserlist.txt`
* `/opt/BoNeSi/urllist.txt`

To use:
```shell
curl -O https://raw.githubusercontent.com/kkirsche/install-BoNeSi/master/install.sh
chmod -x ./install.sh
sh ./install.sh
rm ./install.sh
```
