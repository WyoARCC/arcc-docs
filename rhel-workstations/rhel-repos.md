# Configuring Beneficial RHEL Repositories

## RHEL 7: Standard Repositories
Run the following commands with root priviledges after the machine has 
been registered with Red Hat.

### Registering the machine
If the system is not registered, you'll need to have an IT system administrator
with a Red Hat account register you system at this point. The commands the 
system administrator needs to run are as follows and follow on screen 
instructions:

```
subscription-manager register
```

and

```
subscription-manager attach
```

This may be optionally done in a single step with the following:

```
subscription-manager register --auto-attach
```

However, note that the last method may enable repositories that are of no use
for common workstations or servers. 

### Workstations

```
subscription-manager repos \
    --enable=rhel-7-workstation-rpms \
    --enable=rhel-7-workstation-rh-common-rpms \
    --enable=rhel-7-workstation-extras-rpms \
    --enable=rhel-7-workstation-optional-rpms \
    --enable=rhel-7-workstation-supplementary-rpms \
    --enable=rhel-7-workstation-thirdparty-oracle-java-rpms
```

Optionally, as a scientific software developer, it may be beneficial to
include the Redhat software collections which will provide more up to date
software stacks including GCC, Python, etc.

```
subscription-manager repos \
    --enable=rhel-workstation-rhscl-7-rpms
```

### Servers
If you are operating on a server, then a different set of repos should be
enabled, but are named nearly identical.

```
subscription-manager repos \
    --enable=rhel-7-server-rpms \
    --enable=rhel-7-server-rh-common-rpms \
    --enable=rhel-7-server-extras-rpms \
    --enable=rhel-7-server-optional-rpms \
    --enable=rhel-7-server-supplementary-rpms \
    --enable=rhel-7-server-thirdparty-oracle-java-rpms \
    --enable=rhel-server-rhscl-7-rpms \
```

## RHEL 7: EPEL Repository
The EPEL repository is a community driven repository to provided additional
software which is not found in the Red Hat repositories, but maintains an
aspiration to be enterprise quality. ARCC admininistrators have often used
EPEL repositories to get additional packages not supported by Red Hat directly.

To install the EPEL repository*, run the following with root permissions and
follow any on screen instructions:

```
yum install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum update
```

Then verify that the EPEL repository is enabled by running:

```
yum repolist
```

**NOTE**: Please be aware that for EPEL to work properly, you must enable the
optional packages and the extra packages repositories mentioned  above. If the 
optional repository is not enabled, there are certain packages which will not 
work appropriately.

## RHEL 7: ElRepo Repository
The ElRepo repository is another community driven repository that provides
additional software, generally hardware drivers, to the Red Hat based system.
Often, things like GPU drivers or printer drivers can be found in ElRepo.
However, ARCC administrators don't always typically enable this repository
unless a special piece of hardware is being used. 

Installing the ELRepo repository consist of two parts, importing the key, then
activating the repository. Run the following commands with root priviledges:

```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

yum install http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

yum update
```

Verify that the repository was enabled by running the following command with
root priviledges:

```
yum repolist
```

**NOTE**: The ELRepo repository should only be enabled if you are having 
difficulty with hardware and/or need extra drivers that are not contained
in the Red Hat traditional repositories.


## RHEL 7: CUDA GPGPU Processing

TODO
