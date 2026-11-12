# Lab 1a-2 – Ubuntu Desktop and Command Line Familiarisation

| Student Name | Tsen Pei Hong |
|---|---|
| Kaplan ID | CT0375497 |
| Murdoch ID | 36431456 |
| Module | BRG-ISEA – Introduction to Server Environments and Architectures |
| Date | 11 Nov 2026 |
| Environment | Ubuntu 26.04.1 LTS on VirtualBox 7.2.8 (Windows 11 host) |

## Part 1 – Ubuntu Desktop GUI Familiarisation

Firefox opened google.com, confirming the VM has internet access.

![Screenshot 1](screenshots/01.png)

File Manager (Files) navigating Home > Documents.

![Screenshot 2](screenshots/02.png)

Installing LibreOffice Writer: the first attempt failed because of a typo (libreoffice-writter). Fixed by using the correct package name libreoffice-writer.

![Screenshot 3](screenshots/03.png)

LibreOffice Writer with text typed.

![Screenshot 4](screenshots/04.png)

VLC installed through the App Center (Ubuntu Software Centre).

![Screenshot 5](screenshots/05.png)

Terminal and File Manager side by side: after 'touch hello.txt' in ~/Documents, the file appeared immediately in the File Manager.

![Screenshot 6](screenshots/06.png)

## Part 2 – CLI Basics and File Operations

### Process monitoring

ps -e lists all running processes with their PID.

![Screenshot 7](screenshots/07.png)

top shows live CPU/memory usage. After pressing '1', %Cpu0 and %Cpu1 are shown separately, matching the 2 CPUs given to the VM.

![Screenshot 8](screenshots/08.png)

### Listing files

ls, ls -la (long list + hidden files) and ls -alt (sorted by time).

![Screenshot 9](screenshots/09.png)

ls -lah shows sizes in human-readable form (e.g. 4.0K).

![Screenshot 10](screenshots/10.png)

### Create / edit / view files

touch created testfile, nano was used to add text, cat and less displayed it.

![Screenshot 11](screenshots/11.png)

GUI editor: gedit is not included in Ubuntu 26.04, so the default GNOME Text Editor (gnome-text-editor) was used instead.

![Screenshot 12](screenshots/12.png)

### Copy / move / delete

cp testfile testfile2, mv testfile2 testfile3, then rm testfile3. ls -lah confirms testfile3 was created and then removed.

![Screenshot 13](screenshots/13.png)

### System information

uname -a (kernel 7.0.0-43), lsb_release -a (Ubuntu 26.04.1 LTS, codename resolute) and hostnamectl (Virtualization: oracle).

![Screenshot 14](screenshots/14.png)

## Part 3 – Super User and Permissions

whoami returns peihong; sudo whoami returns root. adduser without sudo fails ('Only root may add a user'). After two typos (addsuer, add user), sudo adduser teststudent succeeded.

![Screenshot 15](screenshots/15.png)

## Part 4 – Network Configuration and DNS

ip a shows the private IP 10.0.2.15 (VirtualBox NAT). ping -c 3 8.8.8.8 had 0% packet loss.

![Screenshot 16](screenshots/16.png)

Ubuntu network settings: wired connection, 1,000 Mb/s.

![Screenshot 17](screenshots/17.png)

### /etc/hosts

First attempt failed: I opened /etc/hots by mistake, so the alias was saved in the wrong file and ping could not resolve GoogleEpicDNS.

![Screenshot 18](screenshots/18.png)

Fixed by removing the wrong file and editing /etc/hosts, adding '8.8.8.8 GoogleEpicDNS'.

![Screenshot 19](screenshots/19.png)

ping GoogleEpicDNS now resolves to 8.8.8.8 successfully.

![Screenshot 20](screenshots/20.png)

### DNS tools

nslookup google.com returns several IPv4 and IPv6 addresses.

![Screenshot 21](screenshots/21.png)

Installed whois and ran whois google.com.

![Screenshot 22](screenshots/22.png)

### Public vs private IP

whatismyipaddress.com shows the public IP (masked for privacy), which is different from the private IP 10.0.2.15.

![Screenshot 23](screenshots/23.png)

、

A private IP is more secure but can only be accessed within the internal network or through a VPN. A public IP can be accessed from anywhere on the internet, but it is less secure.

## Part 5 – System and Hardware Information

lsusb and lspci (left) compared with Settings > System > About (right).

![Screenshot 24](screenshots/24.png)

less /proc/cpuinfo shows processor 0 and 1 (AMD Ryzen 7 7735HS). The 'hypervisor' flag shows it is running inside a VM.

![Screenshot 25](screenshots/25.png)

### Output redirection

lsusb > output_of_lsusb saved the output to a file, viewed with cat/less, then deleted with rm.

![Screenshot 26](screenshots/26.png)

## Extra – Remote Access via SSH

Copy/paste between Windows and the VM did not work (Ubuntu 26.04 uses Wayland). To solve this, I installed openssh-server. The service was first inactive (socket-activated).

![Screenshot 27](screenshots/27.png)

After 'sudo systemctl enable --now ssh', the service is active and listening on port 22.

![Screenshot 28](screenshots/28.png)

Port forwarding error: I first typed the port numbers in the wrong columns.

![Screenshot 29](screenshots/29.png)

Tried ssh inside the VM by mistake (connection refused). The command must be run from the Windows host: ssh peihong@127.0.0.1 -p 2222. After that, I could use PowerShell on Windows with working copy/paste.

![Screenshot 30](screenshots/30.png)

## Part 6 – Software Installation Methods

### Repository (apt)

sudo apt update and sudo apt upgrade -y (108 packages upgraded).

![Screenshot 31](screenshots/31.png)

sudo apt install -y vlc.

![Screenshot 32](screenshots/32.png)

apt search "pdf viewer" and the repository sources file: packages come from sg.archive.ubuntu.com and are verified with a signing key.

![Screenshot 33](screenshots/33.png)

### Binary (.deb)

Downloaded google-chrome-stable_current_amd64.deb from google.com/chrome and installed it with apt install ./<file>.deb.

![Screenshot 34](screenshots/34.png)

Google Chrome appears in the app list (two VLC entries are shown: one from App Center/snap and one from apt).

![Screenshot 35](screenshots/35.png)

Google Chrome running.

![Screenshot 36](screenshots/36.png)

### SaaS

Word for the Web opened in Chrome after logging in with my Kaplan account – no installation needed.

![Screenshot 37](screenshots/37.png)

## Part 7 – Compiling from Source

Installed build-essential (includes gcc) and wrote hello_world.c with nano.

![Screenshot 38](screenshots/38.png)

Compiled with gcc and ran ./hello_world_executable. The source file is 93 bytes (rw-), the executable is 15,960 bytes and already has execute permission (rwx), so chmod was not needed.

![Screenshot 39](screenshots/39.png)

less detects the executable as a binary file (machine code), unlike the readable source file.

![Screenshot 40](screenshots/40.png)

## Reflection

- Which file editors are best for remote access and why?
- I would choose nano because it is simple, easy to remember, and the one I use most often.
- Compare software installation methods: SaaS vs binaries vs repos vs source.
- Among the four methods, SaaS is the easiest because I only need to search online and use it in the browser. The other methods need terminal commands, which are harder to remember.
- What are pros/cons of each method from user and developer perspectives?
- From a user’s perspective, the goal is to use the computer easily, so SaaS or the App Center is the best choice. From a developer’s perspective, it is about understanding the system’s details and doing more complex tasks, so apt or compiling from source gives more control.
- How did using CLI improve your understanding of Linux?
- The CLI shows more detailed information than the GUI, but it is harder to use. I prefer to learn the GUI first and use the CLI after I become familiar, because CLI mistakes are hard to understand when everything is text, while the GUI has icons to guide me.
### Reflection Summary (100–200 words)

If I were a developer, I would definitely choose the CLI. With today’s technology, even if I do not remember a long or complex command, I can search for it online and still finish the task faster. I believe future developers will also choose the CLI, because it is secure and they do not need to memorise everything. They only need to understand what they are doing and be familiar with common commands such as nano and apt install.

For normal users, the GUI is the best choice, because they do not need to use commands to find system information, which they may not understand anyway. This is also why I prefer SaaS and the App Center as a user, as they are simple to use.

In the future, as a developer, I would choose the CLI, but for now, I still prefer the GUI.

### AI Tools Used

I used Claude to format this document, help describe the steps from my screenshots, and translate my answers. All lab work, screenshots and ideas are my own.
