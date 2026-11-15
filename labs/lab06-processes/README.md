# Lab 6 — Live processes and memory pressure

Pair: Dautkaliyeva Diana Machine: MacBook M5 Pro (UTM), Windows 11 ARM64 / Ubuntu 26.04 ARM64 Date: 15.11.2026

## What I did

**Part 1: Process comparison**
1. Started the Python HTTP server on both guests:
```bash
# Ubuntu
python3 -m http.server 8000
# Windows
python -m http.server 8000
```
2. Inspected the process using Task Manager, Process Explorer, and htop.
3. Collected data for PID, parent, memory, handles, and threads.
4. Retrieved parent and file descriptors on Linux:
```bash
ps -o pid,ppid,user,rss,vsz,nlwp,cmd -p 1543
ls /proc/1543/fd | wc -l
sudo ls -l /proc/1543/fd | head
```

**Part 2: Memory pressure**
1. Recorded baseline memory on Ubuntu using `free -h` and `swapon --show`.
2. Started continuous logging:
```bash
while true; do echo "=== $(date +%T) ==="; free -h; sleep 3; done | tee -a memory-pressure.txt
```
3. Ran stress-ng to exhaust memory step by step:
```bash
stress-ng --vm 2 --vm-bytes 70% --timeout 60s
stress-ng --vm 2 --vm-bytes 90% --timeout 60s
stress-ng --vm 2 --vm-bytes 90% --timeout 60s
stress-ng --vm 2 --vm-bytes 120% --timeout 90s
```
4. Checked kernel logs for OOM killer:
```bash
journalctl -k --since "30 min ago" | grep -i -E "out of memory|oom-kill|killed process"
```
5. Checked Windows Event Log for resource exhaustion:
```powershell
Get-WinEvent -FilterHashtable @{LogName='System'; ProviderName='Microsoft-Windows-Resource-Exhaustion-Detector'} -MaxEvents 5 | Format-List TimeCreated, Id, Message
```

## Result

### Part 1: Process Comparison Table

| Parameter | Task Manager | Process Explorer | htop / ps |
| :--- | :--- | :--- | :--- |
| PID | 1212 | 8968 | 1543 |
| Parent (name and PID) | — (not shown) | cmd.exe (5412) | bash (1229) |
| "Memory" as shown by default | 9,220 K | 23,456 K | 6,804 K (RES) |
| Private memory | 11,376 K (Commit size) | 11,528 K (Private Bytes) | N/A |
| Working set / RES | 9,220 K (Memory) | 23,456 K (Working Set) | 6,804 K |
| Virtual size | N/A | 9,452 K (WS Private) | 9,244 K (VIRT) |
| Handles / file descriptors | 140 | 138 | 4 |
| Threads | 3 | 2 | 1 |

**Where the tools disagree:**
1. **Parent Process:** Task Manager does not show the parent process at all. Process Explorer shows `cmd.exe (5412)`, and htop shows `bash (1229)`.
2. **Memory Counting:** Task Manager's default "Memory" shows the Private Working Set (9,220 K), while Process Explorer shows the total Working Set (23,456 K). htop's "RES" (6,804 K) includes shared libraries. All three tools show different numbers because they measure different memory types.

### Part 2: Memory Pressure

| | Before (14:19:14) | During (worst, 14:25:44) | After (14:32:40) |
| :--- | :--- | :--- | :--- |
| Available | 2.9Gi | 68Mi | 2.9Gi |
| Swap used | 0B | 0B | 0B |

**What happened:** As `stress-ng` consumed more memory, available RAM dropped from 2.9Gi to just 68Mi. Because there was no swap space (0B), the system became extremely unresponsive and started thrashing. Eventually, the OOM killer terminated the `stress-ng` process to save the system, and memory returned to normal.

**Kernel OOM Log:**
```text
Out of memory: Killed process 11215 (stress-ng-vm) total-vm:17018364kB, anon-rss:16741964kB, file-rss:2048kB, shmem-rss:0kB, UID:1000 pgtables:32684kB oom_score_adj:1000
```

**Windows Event Log:**
Command returned: `No events were found that match the specified selection criteria.`
*Explanation:* Windows does not have an OOM killer like Linux. It only logs an Event ID 2004 warning when memory is low, but it does not kill processes. Since the Windows guest never actually ran out of memory during this lab, the log is empty.

## What did not work the first time

1. **Terminal issues on Mac:** I could not easily open a second terminal window in Ubuntu because Mac keyboard shortcuts were intercepted by the host. I solved this by running the Python server in the background using the `&` operator.
2. **Port Conflict:** When trying to restart the server, I got `OSError: [Errno 98] Address already in use`. I fixed this by using `killall python3` to terminate the hidden background process before starting a new one.
3. **Python Installer:** The standard Python installer didn't work on Windows ARM64 at first. I had to specifically download the Windows ARM64 installer and check the "Add python.exe to PATH" box.

## Evidence

* `evidence/task-manager.png` — Shows Windows Task Manager with PID, memory, handles, and threads (proving it lacks parent process info).
* `evidence/process-explorer.png` — Shows Process Explorer with the process tree (cmd.exe -> python.exe), Private Bytes, and open handles.
* `evidence/htop.png` — Shows htop in Linux with the process tree, PPID, VIRT, and RES memory columns.
* `evidence/memory-pressure.txt` — Contains the `free -h` logs proving RAM dropped to 68Mi and swap was never used.
* `evidence/kernel-log-extract.txt` — Contains the exact kernel log showing the OOM killer terminating the stress-ng process.
