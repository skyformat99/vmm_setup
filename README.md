# OpenBSD vmm(4) example setup

The idea of this repo is to setup an example vmm(4) envorioment to run VMs over OpenBSD, with OpenBSD.

##** WARNING **
##This will override your files if exists
##** WARNING **

## hostname.vether0

You can set your VMs network here, for now is 10.10.10.0/24

## pf.conf

A typical pf.conf, $ext_if are our inet interfaces, and $int_if are our 'internal', in this case, the
internals interfaces are the ones connected to VMs, in this case vether0 and tapX. You need to edit this
according to your machine.

## sysctl.conf

Now our machine is our VMs GW, so we need to permite the ip forwarding.

## dhcpd.conf

A regular dhcpd setup, for our VMs, setting our network and nameservers.

## vm.conf

Our VMs file, has comments, this is the main file, you need to edit this to your taste.



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
