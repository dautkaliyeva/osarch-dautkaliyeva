# Lab 2 — A Windows guest, and a network between them

Pair:Dautkaliyeva Diana                     Driver first half:
Machine:
Date:02.11.2026

## What I did
I installed Windows 11 ARM64 and Ubuntu in UTM on my MacBook M5. I configured the network, checked IP addresses, tested ping in both directions, and created a Windows Firewall rule for ICMPv4. I also tested memory overcommitment.
Steps, with commands in code blocks. Not prose about the steps.

```
<command>
<output, trimmed>
```

## Result
Both virtual machines had internet access. Windows IP: 192.168.64.4, Ubuntu IP:
192.168.64.2. Ping worked in both directions with 0% packet loss.
During the memory experiment, I increased the total allocated RAM from 8 GB to 26 GB. Host memory usage increased from 17.71 GB to approximately 19GB. Memory pressure remained green, and swap usage stayed at 0 GB.
## What did not work the first time
Windows initially booted into UEFI Shell. I fixed the boot configuration and started the installer.
Ubuntu initially could not ping Windows because of Windows Firewall. I fixed it by adding an inbound ICMPv4 rule.
At least one thing. What I saw, what it turned out to be, what I did about it.

## Evidence
-  [Windows IP configuration](evidence/ipconfig-windows.txt)
-   [Ubuntu IP configuration](evidence/ip-addr-linux.txt)
-  [Ping_in both directions](evidence/ping-both-ways.txt)
-   [Windows Firewall rule](evidence/firewall-rule.txt)
-  [Host memory before](evidence/host-memory-before.png)
-   (Host memory after](evidence/host-memory-after.png)

- [evidence/](evidence/) — one line per file on what it proves
