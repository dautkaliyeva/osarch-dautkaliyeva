# BUILD Instructions: Linux & Windows Test VMs (UTM on Apple Silicon)

### Step 1: Create New VM Wizard
Open UTM and click the '+' icon. Select "Virtualize" and choose Linux/Windows.
![Wizard Setup](evidence/01-new-vm-wizard.png)
*Reasoning: We select Virtualize instead of Emulate to leverage native Apple Silicon hardware acceleration for optimal performance.*

### Step 2: Disk Allocation
Allocate 20 GB of disk space for Linux and 30 GB for Windows.
![Disk Settings](evidence/02-disk-settings.png)
*Reasoning: Dynamic disk allocation ensures space is only used on the host SSD when actual data is written.*

### Step 3: Network Configuration
Set Network Mode to Shared Network (NAT).
![Network Adapter](evidence/03-network-adapter.png)
*Reasoning: Shared Network allows virtual machines to access the internet while retaining local IP connectivity between guest VMs.*

### Step 4: Verification and Evidence Capture
Run system diagnostic commands and save evidence to the `/evidence` folder.
