#!/bin/bash

REDHAT=0
SUSE=0
UBUNTU=0
DEBIAN=0


DISTRO=$(lsb_release -i | cut -f2 -d':')
RELEASE=$(lsb_release -r | cut -f2 -d':')
MAJOR=$(echo $RELEASE | cut -f1 -d'.')
FORMAL=""

echo $DISTRO | grep -i redhat >& /dev/null
[ 0 -eq $? ] && REDHAT=1 && FORMAL="redhat"

echo $DISTRO | grep -i suse >& /dev/null
[ 0 -eq $? ] && SUSE=1 && FORMAL="suse"

echo $DISTRO | grep -i ubuntu >& /dev/null
[ 0 -eq $? ] && UBUNTU=1 && FORMAL="ubuntu"

echo $DISTRO | grep -i debian >& /dev/null
[ 0 -eq $? ] && DEBIAN=1 && FORMAL="debian"

echo $DISTRO | grep -i fedora >& /dev/null
[ 0 -eq $? ] && FEDORA=1 && FORMAL="fedora"

vpn_redhat_7(){

    wget -O /tmp/ps-pulse-linux-latest/installer.rpm \
        https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm
    
    yum -y update

    yum -y install \
        glibc.i686 zlib.i686 webkitgtk3.i686 xulrunner.i686 libproxy.i686
    
    yum -y install /tmp/ps-pulse-linux-latest-installer.rpm

}

vpn_redhat_6() {
    wget -O /tmp/glib-networking-2.28.6.1-2.2.el6.i686.rpm \
            https://arcc.uwyo.edu/sw/glib-networking-2.28.6.1-2.2.el6.i686.rpm

    wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
            https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm

    yum -y update

    yum -y install \
            glibc.i686 zlib.i686 nss.i686 webkitgtk.i686 \
                xulrunn.er.i686 libproxy.i686

    yum -y install /tmp/glib-networking-2.28.6.1-2.2.el6.i686.rpm

    yum -y install /tmp/ps-pulse-linux-latest-installer.rpm
}


vpn_ubuntu_16() {
    wget -O /tmp/ps-pulse-linux-latest-installer.deb \
            https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

    sudo apt update

    sudo apt upgrade

    sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb

    sudo /usr/local/pulse/PulseClient.sh install_dependency_packages
}

vpn_ubuntu_14() {

    wget -O /tmp/ps-pulse-linux-latest-installer.deb \
            https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.deb

    sudo apt update

    sudo apt upgrade

    sudo dpkg -i /tmp/ps-pulse-linux-latest-installer.deb

    sudo /usr/local/pulse/PulseClient.sh install_dependency_packages
}

vpn_suse_42() {
    wget -O /tmp/ps-pulse-linux-latest-installer.rpm \
        https://arcc.uwyo.edu/sw/ps-pulse-linux-latest-installer.rpm 

    zypper refresh
    
    zypper update

    zypper install glibc-32bit \
        libproxy1-32bit \
        libwebkitgtk-1_0-0-32bit \
        libgthread-2_0-0-32bit \
        glib-networking-32bit \
        ca-certificates-cacert

    zypper install /tmp/ps-pulse-linux-latest-installer.rpm
}

begin() {
    echo ""
    echo "This script should be run with root priviledges"
    echo "and will apply updates and install extra packages."
    echo "We will attempt to install Pulse Secure for:"
    echo ""
    echo "    $DISTRO $RELEASE as $FORMAL $MAJOR"
    echo ""
}

finish(){
    echo ""                                                                    
    echo "You should now be able to launch Pulse Secure"                       
    echo ""  
}

check_priv(){
    if [ 0 -ne ${EUID} ]; then
        echo "You must run this script with root priviledges. Exiting." >&2
        exit 1
    fi
}

ierror() {
    echo ""
    echo "ERROR: $1"
    echo ""
    exit $2
}

begin

check_priv
type -t vpn_${FORMAL}_${MAJOR} || \
    ierror "Unknown distro ($FORMAL) or release ($MAJOR)" 1

vpn_${FORMAL}_${MAJOR} || ierror "Examine above output for error." 

finish

