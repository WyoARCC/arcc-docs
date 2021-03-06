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
# Upgrade system
yum upgrade

# Download VPN RPM Package
wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

# Install 32-bit dependencies
yum -y install \
    glibc.i686 zlib.i686 nss.i686 webkitgtk3.i686 \
    xulrunner.i686 libproxy.i686 

# Install Pulse VPN Package
yum -y install /tmp/ps-pulse-linux-latest-installer.rpm
```

### RHEL 6
Installing the client on RHEL 6 will use the terminal application to gain
access to the command line interface. You will need root priviledges to
execute the following commands:

```bash
# Upgrade system
yum upgrade

# Download Pulse VPN Package
wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

# Download extra dependency not available in 64-bit system repository
wget -O /tmp/glib-networking-2.28.6.1-2.2.el6.i686.rpm \
    https://arcc.uwyo.edu/sw/glib-networking-2.28.6.1-2.2.el6.i686.rpm

# Install 32-bit dependencies
yum -y install \
    glibc.i686 zlib.i686 nss.i686 webkitgtk.i686 \
    xulrunn.er.i686 libproxy.i686

# Install extra 32-bit dependency
yum install /tmp/glib-networking-2.28.6.1-2.2.el6.i686.rpm

# Install Pulse VPN Package
yum install /tmp/ps-pulse-linux-latest-installer.rpm
```


### Fedora 24

Installing PulseSecure VPN on the Fedora 24, the terminal will be used in
conjunction with the ``dnf`` command to install the appropriate dependency
packages. Execute the following commands with administrative (i.e., root)
priviledges. Generally you may want to prefix the commands below with ``sudo``.

```bash
# Upgrade system
dnf upgrade

# Download Pulse VPN Package
wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

# Install some dependencies
dnf -y install \
    glibc.i686 zlib.i686 nss.i686 webkitgtk3.i686 \
    xulrunner.i686 libproxy.i686

# Install the Pulse VPN Package
dnf -y install /tmp/ps-pulse-linux-latest-installer.rpm
```

### Ubuntu 16.04 LTS

The installation of the PulseSecure VPN on Ubuntu 16.04 LTS requires the
terminal just as the other installations above. However, the commands and
dependency packages are different. Execute the following commands in a 
terminal session:

```bash
# Update repository metadata
sudo apt update

# Upgrade packages
sudo apt upgrade

# Download Pulse VPN
wget -O /tmp/ps-pulse-linux-latest-installer.deb \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

# Install some dependencies
sudo apt install \
    lib32z1 libc6-i386 libwebkitgtk-1.0-0:i386 \
    libproxy1-plugin-gsettings:i386 \
    libproxy1-plugin-webkit:i386 \
    libdconf1:i386 \
    dconf-settings-backend:i386

# Install the Pulse VPN Package
sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb
```

### Ubuntu 14.04 LTS
The installation of the PulseSecure VPN on Ubuntu 14.04 LTS requires the
terminal or command line interface to be used. Execute the following commands

```bash
# Update repository metadata
sudo apt update

# Upgrade packages
sudo apt upgrade

# Download Pulse VPN Package
wget -O /tmp/ps-pulse-linux-latest-installer.deb \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

# Install some dependencies
sudo apt install \
    lib32z1 libc6-i386 libwebkitgtk-1.0-0:i386 \                                
    libproxy1-plugin-gsettings:i386 \                                           
    libproxy1-plugin-webkit:i386 \                                              
    libdconf1:i386 \                                                            
    dconf-settings-backend:i386

# Install Pulse VPN package.
sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb
```

### OpenSUSE 42.1
YAY! This now works. I used the below commands to install and connect with a fresh installation of OpenSUSE 42.1. Accept any confirmations that may be asked when installing packages with ``zypper``. 

```bash

# Update the system
zypper update

# Reboot if needed

# Fetch the RPM package for the Pulse VPN
wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
    https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

# Install some dependencies
zypper install \
    glibc-32bit libproxy1-32bit libwebkitgtk-1_0-0-32bit \
    libgthread-2_0-0-32bit glib-networking-32bit \
    ca-certificates ca-certificates-cacert ca-certificates-mozilla

# Install the Pulse RPM
zypper install /tmp/ps-pulse-linux-latest-installer.rpm

# Create firewall command symbolic links
ln -s /usr/sbin/iptables /sbin/iptables
ln -s /usr/sbin/ip6tables /sbin/ip6tables

# Create symbolic link to the expected CA Certificate store ...
ln -s /etc/ssl/ca-bundle.pem /etc/ssl/certs/ca-certificates.crt
```

The above steps need to be verified on a new installation of OpenSUSE Leap. These steps have not been verified on Tumbleweed.

## PulseSecure VPN Configuration
Start the PulseSecure VPN client graphically using the appropriate launcher.
In RHEL 6, the client is located in ``Applications --> Other --> Pulse``. In
RHEL 7, Fedora 24, and Ubuntu systems, use the graphical search menu and type 
the keyword "pulse". You may add a connection by clicking the ``+`` button in
the client. The name is arbitrary and the URL should be:
https://wyosecure.uwyo.edu. The next step is to actually attempt to make the
connection. Use your UWyo credentials and proceed with the two-factor choice
for authentication. Upon success, the VPN client will show the connection as 
connected and offer a "disconnect" button.
