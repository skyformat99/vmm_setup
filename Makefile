#
# Makefile pr0n.
#
# by gonzalo@x61.sh
#
#

vmm:
	@echo ""
	@echo "[+] Downloading files from https://github.com/gonzalo-/vmm_setup"
	@echo ""
	@cd /tmp
	@ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/hostname.vether0
	@ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/dhcpd.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/pf.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/vm.conf
	@ftp -V https://raw.githubusercontent.com/gonzalo-/vmm_setup/master/sysctl.conf
	@echo ""
	@echo "[+] Installing files..."
	@echo ""
	@install -m 0640 -g wheel -o root /tmp/hostname.vether0 /etc
	@install -m 0600 -g wheel -o root /tmp/{pf,sysctl,dhcpd,vm}.conf /etc
	@rm /tmp/hostname.vether0 /tmp/*.conf
	@echo ""
	@echo "[+] Enabling vmd & setting dhcpd..."
	@echo ""
	@rcctl enable vmd && rcctl set dhcpd flags vether0
	@echo ""
	@echo "[+] All done, you can reboot now and play with vmm(4)."
	@echo ""
