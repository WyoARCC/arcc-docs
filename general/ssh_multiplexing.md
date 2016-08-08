# Utilizating SSH Multiplexing for Mount Moran

SSH multiplexing is a method of creating a master SSH connection to a machine
and having subsequent connections to the same host that utilizes the master
connection by sharing the same TCP connection. This is a client side
configuration unless the system administrator(s) have disabled the multiplexing
mechanism from the server side. This document highlights the use for the Mount
Moran cluster, but the SSH multiplexing is generic and can be used for other
SSH connections to different hosts as well.

## SSH Multiplexing Configuration
The user configuration file, `~/.ssh/config`, should look similar to the
following to have an entry for the host 'mtmoran.uwyo.edu':


```
Host mtmoran.uwyo.edu
  HostName mtmoran.uwyo.edu
  ControlMaster auto
  ControlPath ~/.ssh/ssh-%r@%h:%p
```

This will minimize the number of two-factor authentication requests that would
normally be required when running with multiple terminal windows and additional
local commands that leverage the SSH protocol to connect to Mount Moran such as
``rsync``, ``scp``, and ``sftp``. The ControlPath parameter above uses string
substitutions for remote user name (%r), remote hostname (%h), and the SSH TCP
port for the server (%p). More information can be found by reading the man page
for SSH configuration file (i.e.,``man 5 ssh_config``).

As a pure example, consider the user, cowboyjoe, who would like to leverage SSH
multiplexing to Mount Moran with minimal effort. They may have the following
configuration file:

```
Host moran mtmoran.uwyo.edu
  HostName mtmoran.uwyo.edu
  User cowboyjoe
  ControlMaster auto
  ControlPath ~/.ssh/ssh-%r@%h:%p
```

Then as long as cowboyjoe has at least 1 SSH session open, then two-factor
authentication should not be required as the original SSH connection is
leveraged. Therefore, cowboyjoe would start an interactive SSH session with the
following command and enter their two factor credentials appropriately:

```
ssh moran
```

Then perhaps he wanted to scp a simple local file (/tmp/test) to Mount Moran in
his home directory, in a separate terminal or shell instance, he would use this:

```
scp /tmp/test moran:~/test
```

He should not be prompted for the two-factor authentication again as the scp
should leverage the already existing connection. The same is should be valid for
both ``sftp`` and ``rsync`` when using the SSH protocol.

## Special Notes
Utilizing SSH multiplexing should be done on a host by host basis and should not
necessarily be used with a generic catch all by utilizing the ``*`` in the SSH
client configuration file. It's a reminder that this is a client side
configuration and does require the use of OpenSSH package which is distributed
with Mac and Linux; using PuTTy on Windows is not a tested platform.
