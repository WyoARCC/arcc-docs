# PulseSecure VPN and GNU/Linux

The PulseSecure virtual private network (VPN) client has significantly better
support for the GNU/Linux operating systems. UWIT staff have tested the ability
to connect on various platforms including Red Hat Enterprise Linux (RHEL) 7, 
Fedora 24, Ubuntu 16.04 LTS, and Ubuntu 14.04 LTS.

## PulseSecure VPN Installation
### RHEL 7

To install the PulseSecure VPN client on RHEL 7, the terminal will be used to
install appropriate dependecies. We hope that this process in the future
becomes easier. With administration (i.e., root) priviledges, execute the
following commands.

```bash

wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

yum upgrade

yum -y install \
    glibc.i686 zlib.i686 nss.i686 webkitgtk3.i686 \
    xulrunner.i686 libproxy.i686 

yum -y install /tmp/ps-pulse-linux-latest-installer.rpm
```

Then 

### RHEL 6
blah blah blah

### Fedora 24

Installing PulseSecure VPN on the Fedora 24, the terminal will be used in
conjunction with the ``dnf`` command to install the appropriate dependency
packages. Execute the following commands with administrative (i.e., root)
priviledges. Generally you may want to prefix the commands below with ``sudo``.

```bash
wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

dnf upgrade

dnf -y install \
    glibc.i686 zlib.i686 nss.i686 webkitgtk3.i686 \
    xulrunner.i686 libproxy.i686

dnf -y install /tmp/ps-pulse-linux-latest-installer.rpm
```

### Ubuntu 16.04 LTS

The installation of the PulseSecure VPN on Ubuntu 16.04 LTS requires the
terminal just as the other installations above. However, the commands and
dependency packages are different. Execute the following commands in a 
terminal session:

```bash

wget -O /tmp/ps-pulse-linux-latest-installer.deb \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

sudo apt update

sudo apt upgrade

sudo apt install \
    lib32z1 libc6-i386 libwebkitgtk-1.0-0:i386 \
    libproxy1-plugin-gsettings:i386 \
    libproxy1-plugin-webkit:i386 \
    libdconf1:i386 \
    dconf-settings-backend:i386

sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb
```

### Ubuntu 14.04 LTS
The installation of the PulseSecure VPN on Ubuntu 14.04 LTS requires the
terminal or command line interface to be used. Execute the following commands

```bash
wget -O /tmp/ps-pulse-linux-latest-installer.deb \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install \
    lib32z1 libc6-i386 libwebkitgtk-1.0-0:i386 \                                
    libproxy1-plugin-gsettings:i386 \                                           
    libproxy1-plugin-webkit:i386 \                                              
    libdconf1:i386 \                                                            
    dconf-settings-backend:i386

sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb
```


## PulseSecure VPN Configuration
Start the PulseSecure VPN client graphically using the appropriate launcher.
In RHEL 6, the client is located in ``Applications --> Other --> Pulse``. In
RHEL 7, Fedora 24, and Ubuntu systems, use the graphical search menu and type 
the keyword "pulse". You may add a connection by clicking the ``+`` button in
the client. The name is arbitrary and the URL should be:
https://pulsevpn.uwyo.edu. The next step is to actually attempt to make the
connection. Use your UWyo credentials and proceed with the two-factor choice
for authentication. Upon success, the VPN client will show the connection as 
connected and offer a "disconnect" button.