# Ticket 1 – "New developer starts Monday, needs a test machine"

## 1. What was asked
From: Algerin T. (Office Manager)
Subject: test machine for new dev

Hi, we have someone starting on Monday and he needs a test computer set up. Nothing special, just so he can try things without breaking anything. Can you write down how to do it so I can do the next one myself? Thanks

## 2. What was actually needed
The request asked for a basic test computer without specifying the operating system, resource limits, or architecture. What was actually needed:
- Deployment of two isolated virtual machines (Linux Ubuntu ARM64 and Windows 11 ARM64) on Apple Silicon (M5 Pro host).
- Allocation of host resources (4 GB RAM for Linux, 6 GB RAM for Windows out of 24 GB total RAM).
- Internal network configuration to allow host-to-guest and guest-to-guest communication with internet access.
- A fully documented, step-by-step build guide (BUILD.md) tailored for a non-technical user.

## 3. What I did
1. Installed UTM hypervisor on macOS (Apple Silicon).
2. Created a Linux VM (Ubuntu ARM64) with 4 GB RAM and 20 GB disk space.
3. Created a Windows 11 VM (ARM64) with 6 GB RAM and 30 GB disk space.
4. Configured shared virtual network adapters for both guests.
5. Tested connectivity between guests using ping and verified system specs.
6. Took VM snapshots for recovery.

## 4. Evidence
- `evidence/01-new-vm-wizard.png`: Скриншот мастера конфигурации виртуальной машины[span_0](start_span)[span_0](end_span).
- `evidence/02-ddisk-setting.png`: Скриншот выделения 20 ГБ виртуального диска[span_1](start_span)[span_1](end_span).
- `evidence/03-network-adapter.png`: Скриншот настройки сетевого адаптера (Shared Network)[span_2](start_span)[span_2](end_span).
- `evidence/04-guest-uname.txt`: Текстовый файл с выводом команды `uname -a`[span_3](start_span)[span_3](end_span).
- `evidence/05-ping-between-guests.txt`: Лог успешной проверки пинга между гостевыми ОС[span_4](start_span)[span_4](end_span).
- `evidence/06-snapshot-list.png`: Скриншот списка снимков состояния (snapshots)[span_5](start_span)[span_5](end_span).

## 5. What I would do differently
Next time, I would automate the VM deployment process using CLI tools like `utmctl` or Vagrant scripts instead of performing manually guided installation via GUI.
