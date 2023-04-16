# 42_Born2beroot

## Project Description

**Born2beroot** is a project designed for students at 42, a coding university, to learn about system administration through the creation and configuration of a virtual machine running a Debian-based operating system. Participants will gain hands-on experience with tasks such as setting up user accounts, managing packages, configuring network settings, and more. The project is aimed at beginners with no prior experience in system administration, but can also be beneficial for those looking to enhance their skills in this area. The project includes detailed instructions and resources to guide participants through the process, making it a great opportunity to learn about system administration in a practical and engaging way.

## Born2beroot Cheat Sheet

### Virtual Machine

A Virtual Machine (VM) is a computer resource that uses software instead of a physical computer to run programs and deploy apps. One or more virtual “guest” machines run on a physical “host” machine. This means that, for example, a virtual Debian virtual machine can run on a physical Mac.

### SELinux (Security-Enhanced Linux)

Security-Enhanced Linux (SELinux) is a Linux kernel security module that provides a mechanism for supporting access control security policies, including mandatory access controls (MAC). 

### AppArmor

AppArmor is a Mandatory Access Control framework. When enabled, AppArmor confines programs according to a set of rules that specify what files a given program can access. This proactive approach helps protect the system against both known and unknown vulnerabilities

### Primary vs logical partition

Logical partition and primary partition are two common partition types.
* The primary partition is the hard disk partition where both OS and other data can be stored, and it is the only partition that can be set active for BIOS to locate. In other words, you can only boot from a primary partition. (The number of primary partitions that can be created is limited).
* The logical partition is also called LPAR, it is a logical segmentation of a mainframe's memory and other resources that allows it to run its own copy of the operating system and associated applications. (The number of logical partitions that can be created is unlimited).
There is no difference between the two kinds of partitions in the ability to store data.

### LVM

It is a system of managing logical volumes, or filesystems, that is much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.

### APT

APT (Advanced Package Tool) is a command-line tool that is used for easy interaction with the dpkg packaging system and it is the most efficient and preferred way of managing software from the command line for Debian and Debian-based Linux distributions like Ubuntu. It manages dependencies effectively, maintains large configuration files and properly handles upgrades and downgrades to ensure system stability.

### APT vs Aptitude

Aptitude is a high-level package manager while APT is a lower-level package manager which can be used by other higher-level package managers.

### UFW

Uncomplicated Firewall (UFW) is a program for managing a netfilter firewall designed to be easy to use. 


## Useful commands

### Simple setup
| Command | Description |
| --- | --- |
| chage -l <username>	| Checks if passwords rules are working on the user. |
| sudo ufw status	| Checks the ufw status. |
| sudo service ssh status	| Checks the status of the ssh. |
| uname -a	| Checks the operating system. |
| head -n 2 /etc/os-release	| Also checks the operating system. |

### User
| Command | Description |
| --- | --- |
| getent group | Checks the groups created. |
| getent group <groupname> | Checks the users under a group. |
| sudo adduser <username> | Creates a new user. |
| sudo nano /etc/pam.d/common-password | To set the length of the password, the characters... |
| sudo nano /etc/login.defs | To set password expiration date, etc. |
| sudo addgroup <groupname> | Creates a new group. |
| sudo adduser <username> <groupname> | Adds a user to a group. |

### Hostname and partitions
| Command | Description |
| --- | --- |
| hostname | Check current hostname. |
| sudo hostnamectl set-hostname <newhostname>	| Changes the hostname. |
| sudo nano /etc/hosts | And then change the old hostname for the new one. |
| lsblk | See the partitions. |

### Sudo
| Command | Description |
| --- | --- |
| command -v sudo	| To check if sudo is installed. |
| sudo adduser <username> sudo	| Adds the user to the sudo group. | 
| sudo visudo	| Access sudoers file to edit the configuration of sudo. |

### UFW
| Command | Description |
| --- | --- |
| command -v ufw	| To check if ufw is installed. |
| sudo ufw status	| Checks the ufw status. |
| sudo ufw allow <port_number> | Allows the port indicated. |
| sudo ufw status numbered | Checks the ufw status with numbers on the left of each rule. |
| sudo ufw delete <number> | Deletes the rule that corresponds to that number. |

### SSH
| Command | Description |
| --- | --- |
| command -v ssh | To check if ssh is installed. |
| sudo service ssh status | Checks the status of the ssh. |
| sudo nano /etc/ssh/ssh_config | To check the port used by ssh. |
| ip a | To check the IP to use for connect from the host terminal. |
| ssh <vmusername>@<vmip> -p 4242 | (In the host terminal) to connect to the VM using ssh. |

### Script monitoring
| Command | Description |
| --- | --- |
| sudo crontab -u root -e	| To edit the crontab file for user root |
| sudo crontab -e	| To edit the crontab file. |
| sudo service cron stop	| Stop Cron |
| sudo nano /monitoring.sh | To edit the monitoring.sh file |

### Other Commands
| Command | Description |
| --- | --- |
| cut -d: -f1 /etc/passwd	| Checks all the users in the machine. |
| groups | Checks which groups my user belongs to. |
| /usr/sbin/aa-status	| Checks the status of AppArmor. |
| ss -tulp | Shows the net status, ports... |

## Monitoring Script

[monitoring.sh](https://github.com/mpotthar/42_Born2beroot/blob/main/monitoring.sh)

The script should provide the following information:

> The architecture of your operating system and its kernel version.

> The number of physical processors.

> The number of virtual processors.

> The current available RAM on your server and its utilization rate as a percentage.

> The current available memory on your server and its utilization rate as a percentage.

> The current utilization rate of your processors as a percentage.

> The date and time of the last reboot.

> Whether LVM is active or not.

> The number of active connections.

> The number of users using the server.

> The IPv4 address of your server and its MAC (Media Access Control) address.

> The number of commands executed with the sudo program.
