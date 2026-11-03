# BUILD Instructions: Linux & Windows Test VMs (UTM on Apple Silicon)

### Step 1: Create New VM Wizard
Open UTM, click the '+' icon, select "Virtualize", and choose Linux.
![01-new-vm-wizard](evidence/01-new-vm-wizard.png)
*Reasoning: We select Virtualize to leverage native Apple Silicon hardware acceleration for optimal performance.*

### Step 2: Disk Allocation
Specify the size of the drive where data will be stored (set to 20 GiB).
![02-ddisk-setting](evidence/02-ddisk-setting.png)
*Reasoning: Dynamic disk allocation ensures space is only used on the host SSD when actual data is written.*

### Step 3: Network Configuration
Configure the network adapter hardware settings to Shared Network.
![03-network-adapter.png](evidence/03-network-adapter.png)
*Reasoning: Shared Network allows virtual machines to access the internet while retaining local IP connectivity between guest VMs.*

### Step 4: Verification and Evidence Capture
Run system diagnostic commands and save evidence to the `/evidence` folder.
