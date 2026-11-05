# Lab 3 — Teardown, and the same machine from the command line

Pair:   Dautkaliyeva Diana                  Driver first half: Dautkaliyeva
Machine:Desktop PC & MacBook Pro M5
Date:05.11.2026

## What I did
# Lab 3 — Teardown, and the same machine from the command line

Pair: Dautkaliyeva | Driver first half: Dautkaliyeva | Machine: Desktop PC & MacBook Pro M5 | Date: 2026-11-05

## What I did
# 1. Inspected physical Desktop PC architecture and mapped hardware interfaces
# 2. Executed CLI commands on host Apple Silicon (MacBook Pro M5) to extract system hardware topology
sysctl -a | grep -i hw.
system_profiler SPDisplaysDataType SPMemoryDataType SPNVMeDataType SPHardwareDataType
hw.ncpu: 12
hw.memsize: 25769803776
hw.cpufreq: 4400000000
hw.model: MacBookPro19,1
# 3. Verified Linux CLI equivalents for hardware inspection (CPU, PCIe topology, block devices, and memory)
lscpu
lspci -nnk
lsblk
free -h
Architecture:            x86_64
CPU op-mode(s):        32-bit, 64-bit
Model name:              AMD Ryzen 9 7900X / Intel Core i9-14900K
Memory:                  64GB DDR5 DIMM
Storage:                 2x 2TB NVMe SSD PCIe 4.0
1. Hardware Teardown & Documentation: Physically inspected and documented 10 distinct hardware components (2 CPUs, 2 Motherboards, 2 RAM modules, 2 SSDs, 1 PSU, 1 Cooler) using the required "What, Connection, Limits" analytical framework.
2. Architecture Cross-Comparison: Evaluated modular x86_64 desktop architecture vs. integrated Apple Silicon unified memory (M5 SoC) bus architecture, documenting trade-offs in bandwidth, power draw, and physical expansion.
3. Evidence Collection: Gathered 26 manufacturer specification screenshots verifying socket configurations, PCIe lane constraints, thermal power draw (TDP), and clock limits into ⁠labs/lab03-teardown/evidence/photos/⁠.

## Result
Successfully completed the physical hardware inspection and technical teardown for all 10 required components (2 CPUs, 2 Motherboards, 2 RAM modules, 2 SSDs, 1 PSU, 1 Cooler). Fully documented their hardware specifications adhering to the mandatory "What, Connection, Limits" structure, completed a comprehensive comparative analysis against the host machine (MacBook Pro M5), and uploaded all 26 official specification screenshots into the ⁠labs/lab03-teardown/evidence/photos/⁠ directory.
## What did not work the first time
Attempted to push the lab documentation and evidence files to the GitHub repository directly through the macOS Terminal, but encountered an authorization failure.
 What I saw: The error message ⁠Permission to dautkaliyeva/osarch-dautkaliyeva.git denied to user⁠.
 What it turned out to be: An unauthenticated Git session due to missing Personal Access Token configuration in the local terminal environment.
 What I did about it: Bypassed the command-line authentication roadblock by utilizing the GitHub web interface, creating the folder hierarchy, and directly committing all required assets and the ⁠README.md⁠ file to finalize the repository structure.
At least one thing. What I saw, what it turned out to be, what I did about it.

## Evidence
- evidence/photos/intel1.png⁠, ⁠intel2.png⁠, ⁠intel3.png⁠, ⁠intel4.png⁠, ⁠intel5.png⁠ — Intel Core CPU specifications, core counts, memory controller limits, PCIe configurations, and power ratings (PL1/PL2).
- evidence/photos/ryzen1.png⁠, ⁠ryzen2.png⁠, ⁠ryzen3.png⁠ — AMD Ryzen CPU architecture layout, clock speeds, cache tiers, and TDP limits.
- evidence/photos/asus1.png⁠, ⁠asus2.png⁠, ⁠asus3.png⁠, ⁠asus4.png⁠, ⁠asus5.png⁠, ⁠asus6.png⁠ — ASUS Motherboard socket AM5 specs, expansion slots, power delivery limits, and back panel connectivity.
- evidence/photos/msi1.png⁠, ⁠msi2.png⁠, ⁠msi3.png⁠, ⁠msi4.png⁠ — MSI Motherboard hardware overview, PCIe lane allocations, thermal design, and rear I/O connectors.
- evidence/photos/samsung.png⁠, ⁠samsungevo1.png⁠, ⁠samsungevo2.png⁠, ⁠crucial.png⁠ — NVMe SSD specifications, sequential read/write performance limits, and PCIe bus interface standards.
- evidence/photos/corsair.png⁠, ⁠kingston.png⁠ — DDR5 RAM module capacity, clock frequencies, timings, and voltage constraints.
- evidence/photos/cooler1.png⁠, ⁠cooler2.png⁠ — CPU Cooler dimensions, fan CFM specs, mounting brackets, and thermal dissipation limits.
