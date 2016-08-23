#!/bin/bash
# Basic script to quickly register and enable the my desired repos.
# Add options to switch flavor and version later, perhaps auto-sense even

# Dry Run (add flag to switch to on later ...
DRYRUN=0

FLAVOR=$(cat /etc/redhat-release | cut -f5 -d" " | tr "[:upper:]" "[:lower:]")
RELEASE=$(lsb_release -rs | cut -f1 -d.)
ENABLE_DTS=0

echo "Discovered: $FLAVOR $RELEASE"

DR=""
if [ 1 = $DRYRUN ]; then
    DR="echo"
fi

# Register system
$DR subscription-manager register --auto-attach

# Adjust repositories
$DR subscription-manager repos --disable="*" 2>&1 > /dev/null
$DR subscription-manager repos \
    --enable=rhel-$RELEASE-$FLAVOR-rpms \
    --enable=rhel-$RELEASE-$FLAVOR-rh-common-rpms \
    --enable=rhel-$RELEASE-$FLAVOR-extras-rpms \
    --enable=rhel-$RELEASE-$FLAVOR-optional-rpms \
    --enable=rhel-$RELEASE-$FLAVOR-supplementary-rpms \
    --enable=rhel-$RELEASE-$FLAVOR-thirdparty-oracle-java-rpms

# Update
$DR yum -y update

# Enable EPEL
$DR yum -y install \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-$RELEASE.noarch.rpm

$DR yum -y update

