# Configuring Beneficial RHEL Repositories

## Standard Repositories
Run the following commands with root priviledges after the workstation has 
been registered with Red Hat.

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
    --enable=rhel-workstation-rhscl-7-source-rpms
```

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

## EPEL Repository
The EPEL repository is a community driven repository to provided additional
software which is not found in the Red Hat repositories, but maintains an
aspiration to be enterprise quality. ARCC admininistrators have often used
EPEL repositories to get additional packages not supported by Red Hat directly.

## ElRepo Repository
The ElRepo repository is another community driven repository that provides
additional software, generally hardware drivers, to the Red Hat based system.
Often, things like GPU drivers or printer drivers can be found in ElRepo.
However, ARCC administrators don't always typically enable this repository
unless a special piece of hardware is being used. 
