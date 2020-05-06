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
sudo cat /etc/oracle-release
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
echo "Disable RHN plugin"
sudo /bin/ed /etc/yum/pluginconf.d/rhnplugin.conf << EOF
/enabled = 1
s/enabled = 1/enabled = 0
w
q
EOF
sudo grep enabled /etc/yum/pluginconf.d/rhnplugin.conf
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Disable subscription manager plugin"
sudo /bin/ed /etc/yum/pluginconf.d/subscription-manager.conf << EOF
/enabled=1
s/enabled=1/enabled=0
w
q
EOF
sudo grep enabled /etc/yum/pluginconf.d/subscription-manager.conf
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "Disable uln plugin"
sudo /bin/ed /etc/yum/pluginconf.d/ulninfo.conf << EOF
/enabled = 1
s/enabled = 1/enabled = 0
w
q
EOF
sudo grep enabled /etc/yum/pluginconf.d/ulninfo.conf
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "removing rhn systemid"
sudo /bin/rm -rf /etc/sysconfig/rhn/systemid
sudo /bin/mv -f /etc/yum.repos.d/redhat.repo /etc/yum.repos.d/redhat.repo_moved
sudo /bin/mv -f /etc/yum.repos.d/rhel-source.repo /etc/yum.repos.d/rhel-source.repo_moved
sudo /bin/mv -f /etc/yum.repos.d/oracle-linux-ol6.repo /etc/yum.repos.d/oracle-linux-ol6.repo_moved
sudo /bin/mv -f /etc/yum.repos.d/uek-ol6.repo /etc/yum.repos.d/uek-ol6.repo_moved
echo -e "\n"

echo "---------------------------------------------------"

echo -e "\n"
echo "cleaning yum cache"
sudo /usr/bin/yum clean all
echo "All repo's refreshed"
sudo /usr/bin/yum repolist &> /dev/null
sudo /usr/bin/yum repolist
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
