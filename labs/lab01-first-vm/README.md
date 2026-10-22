# Lab 1 — Your first virtual machine

Pair:                     Driver first half:
Machine:
Date:22.10.2026

## What I did

Installed Ubuntu Server ARM64 on macOS using UTM, verified system release, simulated a system failure by removing boot files, and restored the machine from a clean clone.

```bash
lsb_release -a
sudo rm -rf /boot/*
sudo reboot

Steps, with commands in code blocks. Not prose about the steps.

```
<command>
<output, trimmed>
```

## Result
virtual Maschine successfully installed, tested of failure recovery, and restored using clean snapshot/clone
## What did not work the first time
removing /etc/hostname didn't cause an immediate boot break due to cloud-init/systemd configuration. removing /boot/* successfully simulated boot failure (UEFI Shell)
At least one thing. What I saw, what it turned out to be, what I did about it.

## Evidence
- [evidence/](evidence/)[guest-release.txt](https://github.com/user-attachments/files/33826649/guest-release.txt)Proof of OS installation and version details.
- [evidence/](evidence/)<img width="1512" height="982" alt="snapshot-list" src="https://github.com/user-attachments/assets/f7b456b5-341f-4309-91b5-a19a224addd4" /> Proof of clean VM clone created.
- [evidence/](evidence/)<img width="1512" height="982" alt="broken" src="https://github.com/user-attachments/assets/3d6a2df4-f206-4ff6-a482-b78cfe228854" /> Proof of system failure simulation (UEFI Shell boot error).


- [evidence/](evidence/) — one line per file on what it proves
