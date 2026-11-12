# Lab 1a-1 – Virtualisation and Linux Setup

| Student Name | Tsen Pei Hong |
|---|---|
| Kaplan ID | CT0375497 |
| Murdoch ID | 36431456 |
| Module | BRG-ISEA – Introduction to Server Environments and Architectures |
| Date | 10 Nov 2026 |

## Environment

| Item | Details |
|---|---|
| Host OS | Windows 11 |
| Hypervisor | Oracle VirtualBox 7.2.8 |
| Guest OS | Ubuntu 26.04.1 LTS Desktop (amd64) |
| VM settings | 4096 MB RAM, 2 CPUs, 25 GB virtual disk, BIOS (no EFI) |
| Network | NAT |
| Filesystem | ext4, mounted at / |

## Step 1 – Install VirtualBox

Oracle VirtualBox 7.2.8 is installed on the Windows 11 host.

![Screenshot 1](screenshots/01.png)

## Step 2 – Download the Ubuntu ISO

Downloaded the Ubuntu 26.04.1 LTS Desktop ISO (Intel/AMD 64-bit, 5.9 GB) from the official Ubuntu website.

![Screenshot 2](screenshots/02.png)

## Step 3 – Create the Virtual Machine

Created a new VM named 'Ubuntu-ISEA-1A-1' and selected the ISO. Unattended installation was left unticked so Ubuntu could be installed manually. VirtualBox auto-detected the OS as FreeBSD, so it was changed manually to Linux / Ubuntu (64-bit).

![Screenshot 3](screenshots/03.png)

Virtual hardware: 4096 MB RAM, 2 CPUs, 25 GB disk.

![Screenshot 4](screenshots/04.png)

Summary of the VM configuration before creation.

![Screenshot 5](screenshots/05.png)

## Step 4 – Install Ubuntu

Booted the VM from the ISO and started the Ubuntu installer (language: English).

![Screenshot 6](screenshots/06.jpg)

Internet connection: wired connection (provided through VirtualBox NAT).

![Screenshot 7](screenshots/07.jpg)

Disk setup: 'Erase disk and install Ubuntu' – this only affects the 25 GB virtual disk, not the host.

![Screenshot 8](screenshots/08.jpg)

Encryption: no encryption (lab VM).

![Screenshot 9](screenshots/09.jpg)

Review of choices: installed on VBOX HARDDISK (sda), partition sda2 formatted as ext4 and mounted at /.

![Screenshot 10](screenshots/10.jpg)

Installation log showing packages being unpacked and set up.

![Screenshot 11](screenshots/11.png)

Installation completed.

![Screenshot 12](screenshots/12.jpg)

## Step 5 – Issue: VirtualBox crash on restart

After clicking 'Restart now', VirtualBoxVM.exe crashed with a memory error. The VM was also trying to boot from CD-ROM and network (iPXE) instead of the hard disk.

![Screenshot 13](screenshots/13.png)

Fix: checked Storage – the optical drive was empty and the virtual disk (Ubuntu-ISEA-1A-1.vdi) was attached.

![Screenshot 14](screenshots/14.png)

Fix: changed the boot order so the Hard Disk boots first and unticked Floppy/Network.

![Screenshot 15](screenshots/15.png)

After the fix, the VM booted into the installed Ubuntu desktop.

![Screenshot 16](screenshots/16.png)

## Step 6 – Network Configuration

Network adapter 1 is attached to NAT, so the VM shares the host's internet connection.

![Screenshot 17](screenshots/17.png)

## Step 7 – Verify Ubuntu with Terminal

Opened Terminal. Prompt: peihong@peihong-VirtualBox:~$

![Screenshot 18](screenshots/18.png)

Ran 'sudo apt update' – package lists downloaded from sg.archive.ubuntu.com; 101 packages can be upgraded.

![Screenshot 19](screenshots/19.png)

## Step 8 – Install VirtualBox Guest Additions

Command: sudo apt install -y virtualbox-guest-utils virtualbox-guest-x11

![Screenshot 20](screenshots/20.png)

Installation finished successfully. The Ubuntu screen now resizes with the VirtualBox window.

![Screenshot 21](screenshots/21.png)

## Deliverables

| Deliverable | Status |
|---|---|
| VirtualBox installed | Done – Step 1 |
| Ubuntu ISO downloaded | Done – Step 2 |
| VM created | Done – Step 3 |
| Ubuntu installed | Done – Step 4 |
| Networking configured (NAT) | Done – Step 6 |
| Ubuntu running with Terminal | Done – Step 7 |
| Guest Additions installed | Done – Step 8 |

## Reflection

- What are the advantages of using virtual machines for testing and development?
- Mistakes inside the VM don’t affect the host computer, so I can try things freely. For example, I
- can practice Linux commands, test hacking tools, or try different operating systems without
- worrying about damaging my main system.
- What challenges did you face during installation or network setup?
- As shown in Step 5 above, VirtualBox crashed with an error after I restarted the VM. I resolved it
- by changing the system setting, setting the Hard Disk as the first boot device.
- What are the differences between NAT and Bridged networking in VirtualBox?
- The main difference is that NAT lets the VM “hide” behind the host to access the internet, while Bridged mode makes the VM a separate computer on the local network.
- What did you learn about Linux distributions (distros) from your reading?
- A Linux distribution (distro) is a complete operating system that combines the Linux kernel with different desktop interfaces and software management tools. Each distro is packaged for a specific use, such as daily office work, servers, or cyber security.
## AI Tools Used

I used Claude to format this document, help describe the steps from my screenshot, and translate my reflection answers from Chinese to English. All lab work screenshots and ideas are my own.
