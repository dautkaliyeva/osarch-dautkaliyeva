# Lab 4 — Partition, mirror, fail, recover

Pair: Dautkaliyeva Diana   Driver first half: Dautkaliyeva Diana
Machine: MacBook M5 Pro, Windows 11 & Linux Ubuntu (UTM)
Date: 11.11.2026

## What I did

On Windows, I initialized a new virtual disk using Disk Management. I chose the GPT partition style because it is the modern standard for UEFI systems and supports larger drives and more partitions than MBR. I created an NTFS volume and assigned it the letter F. 
On Linux, I attached three 1GB virtual disks (vdb, vdc, vdd). I used `mdadm` to create a RAID 1 array (/dev/md0) using vdb and vdc. I formatted it as ext4 and mounted it. I wrote a test file, recorded its md5 checksum, simulated a disk failure on vdb, verified the data was still readable (checksum matched), and then successfully rebuilt the array by adding the third disk (vdd).

## Result

Layout before and after:
Before: /dev/vdb, /dev/vdc, /dev/vdd were raw unformatted disks.
After: /dev/md0 is an active RAID 1 array, mounted at /mnt/raid1, containing the test file.

**The README answers one question in three sentences:**
*No, RAID 1 will not help in this scenario. RAID 1 provides redundancy against hardware failure (like a hard drive dying), not against human error or accidental file deletion. If a file is deleted, the deletion is instantly mirrored to both disks, so the data is lost.*

## What did not work the first time

When I first tried to create the array, I accidentally pressed Enter too early, so the command executed without the second disk. I had to stop the incomplete array (`mdadm --stop /dev/md0`), wipe the superblocks, and type the full command again. Also, I initially made a typo when trying to format the filesystem, typing `mkfc` instead of `mkfs`, which resulted in a "command not found" error.

## Evidence

- [evidence/lsblk-before.txt](evidence/lsblk-before.txt) — shows the three raw disks before creating the array.
- [evidence/array-healthy.txt](evidence/array-healthy.txt) — shows the RAID 1 array operational [UU].
- [evidence/array-degraded.txt](evidence/array-degraded.txt) — shows the array after simulating a disk failure [U_].
- [evidence/checksum-before.txt](evidence/checksum-before.txt) — shows the MD5 hash before the failure.
- [evidence/checksum-after-failure.txt](evidence/checksum-after-failure.txt) — proves the file is still readable and the hash matches after the failure.
- [evidence/array-rebuilt.txt](evidence/array-rebuilt.txt) — shows the array fully recovered [UU].
- [evidence/windows-partition.txt](evidence/windows-partition.txt) — shows the Diskpart output proving GPT and NTFS formatting on Windows.
