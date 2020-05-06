#!/bin/bash

#trap '[[ $BASH_COMMAND != echo* ]] && echo $BASH_COMMAND' DEBUG #echos commands except echo
#Author ahilan.swaminathan@cgi.com

echo -e "\n"
echo "Date & Time of Report:"
sudo date
sudo uptime
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Hostname:"
sudo hostname;hostname -i
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "RHEL Version:"
sudo cat /etc/redhat-release
echo -e "\n"

echo "Kernel Version:"
sudo uname -r
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "File System Info:"
sudo df -Th
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Cpu Info:"
sudo cat /proc/cpuinfo |grep -i processor|wc -l
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Mem Info:"
sudo cat /proc/meminfo |grep -i MemTotal
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "checking sudo access"
sudo /bin/cat /etc/sudoers
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "checking iptables port"
sudo /sbin/iptables -L -n -v
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Changing Jboss directory permission and owners"
sudo /bin/chown jboss:jboss /usr/lib/jvm/java-1.8.0/jre/lib -R
sudo /bin/chmod 775 /usr/lib/jvm/java-1.8.0/jre/lib -R
echo -e "\n"

echo "--------------------------------------------------"

