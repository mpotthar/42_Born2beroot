#!bin/bash
arch=$(uname -a)
phycpu=$(cat /proc/cpuinfo | grep "cpu cores" | awk '{printf($4)}')
vircpu=$(cat /proc/cpuinfo | grep processor | wc -l)
memusg=$(free --mega | grep Mem | awk '{printf("%s/%sMB (%.2f%%)", $3, $2, ($3/$2)*100)}')
dskusg=$(df -m --total | grep total | awk '{printf("%.f", $3)}' && df -h --total | grep total | awk '{printf("/%.fGb (%s)", $2, $5)}')
cpuld=$(vmstat 1 2 | tail -1 |  awk '{printf("%.1f%%" , 100 - $15)}')
lboot=$(who -b | awk '{printf("%s %s", $3, $4)}')
lvmusg=$(lsblk | grep lvm | wc -l | awk '{if ($1){printf("yes");} else{printf("no");}}')
tcpcon=$(ss -t | grep ESTAB | wc -l)
usrlog=$(users | wc -w)
netip=$(hostname -I)
netmac=$(ip a | grep "link/ether" | awk '{printf($2)}')
suinfo=$(sudoreplay -d /var/log/sudo/ -l | wc -l)
wall	"		#Architecture: $arch
		#CPU physical: $phycpu
		#vCPU: $vircpu
		#Memory Usage: $memusg
		#Disk Usage: $dskusg
		#CPU load: $cpuld
		#Last boot: $lboot
		#LVM use: $lvmusg
		#Connections TCP: $tcpcon ESTABLISHED
		#User log: $usrlog
		#Network: IP $netip ($netmac)
		#Sudo: $suinfo cmd	"
