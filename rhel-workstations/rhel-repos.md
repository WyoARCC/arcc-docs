# Configuring Beneficial RHEL Repositories

Run the following commands with root priviledges after the workstation has 
been registered with Red Hat.

```
subscription-manager repos \
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
