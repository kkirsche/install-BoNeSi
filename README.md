# install-BoNeSi
For Installing the BoNeSI DDoS Botnet Simulator on Kali 1.1.0a

Installs:
* libpcap-dev
* libnet-dev
* automake-1.10.2
* Installs https://github.com/Markus-Go/bonesi.git to `/opt/BoNeSi`

It then cleans up that directory leaving only:
* The `bin` command that was installed
* `/opt/BoNeSi/50k-bots`
* `/opt/BoNeSi/browserlist.txt`
* `/opt/BoNeSi/urllist.txt`
