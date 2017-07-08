#
#

## debug
#set -x

echo ""
echo "[+] Downloading files from https://github.com/gonzalo-/vmm_setup"
echo ""
cd /tmp
ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/hostname.vether0
ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/dhcpd.conf
ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/pf.conf
ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/vm.conf
ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/sysctl.conf
echo ""
echo "[+] Installing files..."
echo ""
install -m 0640 -g wheel -o root /tmp/hostname.vether0 /etc
install -m 0600 -g wheel -o root /tmp/{pf,sysctl,dhcpd,vm}.conf /etc
rm /tmp/hostname.vether0 /tmp/*.conf
echo ""
echo "[+] Downloading OpenBSD kernels and Alpine Linux iso..."
echo ""
mkdir -p /VMs/sets/snapshots/amd64/
mkdir -p /VMs/linux
cd /VMs/linux && ftp -V https://nl.alpinelinux.org/alpine/v3.6/releases/x86_64/alpine-virt-3.6.0-x86_64.iso
cd /VMs/sets/snapshots/amd64/ && ftp -V ftp3.usa.openbsd.org/pub/OpenBSD/snapshots/packages/amd64/bsd{.mp,.rd}
rm /tmp/hostname.vether0 /tmp/*.conf
echo ""
echo "[+] Enabling vmd & setting dhcpd..."
echo ""
rcctl enable vmd && rcctl enable dhcpd && rcctl set dhcpd flags vether0
echo ""
echo "[+] All done, you can reboot now and play with vmm(4)."
echo ""
