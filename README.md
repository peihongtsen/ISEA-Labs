# ISEA-Labs

Lab documentation for **Murdoch BRG-ISEA – Introduction to Server Environments and Architectures** (Kaplan Singapore).

| | |
|---|---|
| Student Name | Tsen Pei Hong |
| Kaplan ID | CT0375497 |
| Murdoch ID | 36431456 |
| Additional Service | Nextcloud |
| Environment | Ubuntu 26.04.1 LTS on VirtualBox (local) and Ubuntu 24.04 LTS on AWS EC2 (cloud) |
| Live site | https://peihong-isea.duckdns.org |

## Labs

| # | Lab | Topic |
|---|---|---|
| 1 | [Lab 1a-1](Lab1a-1-Linux-Setup/README.md) | Virtualisation and Linux setup |
| 2 | [Lab 1a-2](Lab1a-2-Ubuntu-Desktop-CLI/README.md) | Ubuntu Desktop and CLI familiarisation |
| 3 | [Lab 1b-1](Lab1b-1-Linux-Services/README.md) | Linux services, SSH, firewalls and compression |
| 4 | [Lab 1b-2](Lab1b-2-Linux-Permissions/README.md) | Linux file permissions and group access control |
| 5 | [Lab 1b-3](Lab1b-3-Searching-File-Systems/README.md) | File search, analysis and archiving |
| 6 | [Lab 2a-1](Lab2a-1-TCO-Analysis/README.md) | Total Cost of Ownership (TCO) analysis |
| 7 | [Lab 2a-2](Lab2a-2-AWS-EC2-Web-Server/README.md) | Cloud web server on AWS EC2 with Apache |
| 8 | [Lab 2b-1](Lab2b-1-Bash-Scripting/README.md) | Bash scripting and system automation |
| 9 | [Lab 2b-2 / 2b-3](Lab2b-2-3-Regex-AWK-Apache-Logs/README.md) | Regex, AWK and Apache log analysis |
| 10 | [Lab 3a](Lab3a-DNS-and-HTTPS/README.md) | Domain, DNS and HTTPS with Let's Encrypt |
| 11 | [Lab 3b-1](Lab3b-1-Backup-Script-Cron-Cloud/README.md) | Backup script, cron jobs and cloud export with scp |

All labs are completed (November 2026). Each folder has a README with steps, commands, outputs and screenshots.

## Additional Server Service

| Service | Topic |
|---|---|
| [Nextcloud](Additional-Service-Nextcloud/README.md) | Self-hosted file sharing server with users and permissions |

## My Learning Blog

### 1. What I learned about using Linux Ubuntu
*21 Nov 2026*

Before this module, I had never used Linux. I only knew that many people use it to set up servers.

The hardest part for me was installing software on Linux and then setting up security, such as opening the right ports in the firewall so that other people can access the service. It is not enough to just install something; the server must also be configured correctly.

The command I used the most is `apt install`, because almost everything I needed had to be downloaded and installed with it.

Now I think the command line is better than a GUI. The command line shows more detailed information, and I do not need to spend time searching through menus. I just type the command and get the result straight away. I think this is also why most servers do not have a GUI.

These skills are useful for my career. A system engineer works with many VMs and servers every day. In IT support we use them less often, but knowing the basics is much better than knowing nothing.

Next time, I will check the settings carefully before I install a VM. When I set up more VMs in the future, I need to be more careful.


## AI Tools Used

I used Claude to format the lab documents, help describe the steps from my screenshots, and translate my reflection answers from Chinese to English. All lab work, screenshots and ideas are my own.
