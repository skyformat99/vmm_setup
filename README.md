# OpenBSD vmm(4) example setup

The idea of this repo is to setup an example vmm(4) envorioment to run VMs over OpenBSD, with OpenBSD.

** WARNING **
This will override your files if exists
** WARNING **

## Makefile usage

Assuming you have comp6X.tgz installed.

```
# cd /tmp
# ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/Makefile
# make vmm

[+] Downloading files from https://github.com/gonzalo-/vmm_setup

hostname.vether0	100% |*********************************************************|    39       00:00
dhcpd.conf		100% |*********************************************************|   420       00:00
vm.conf			100% |*********************************************************|   216       00:00
pf.conf			100% |*********************************************************|  1882       00:00
sysctl.conf		100% |*********************************************************|    25       00:00

[+] Installing files...

[+] Enabling vmd & setting dhcpd...

[+] All done, you can reboot now and play with vmm(4).

# reboot
```

## vmm.sh usage

```
# cd /tmp
# ftp -o - https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/vmm.sh | sh -
Trying 151.101.24.133...
Requesting https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/vmm.sh
1329 bytes received in 0.00 seconds (6.12 MB/s)

[+] Downloading files from https://github.com/gonzalo-/vmm_setup

hostname.vether0	100% |*********************************************************|    39       00:00
dhcpd.conf		100% |*********************************************************|   420       00:00
vm.conf			100% |*********************************************************|   216       00:00
pf.conf			100% |*********************************************************|  1882       00:00
sysctl.conf		100% |*********************************************************|    25       00:00

[+] Installing files...

[+] Enabling vmd & setting dhcpd...

[+] All done, you can reboot now and play with vmm(4).

# reboot
```
