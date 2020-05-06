#!/bin/sh
ALERT=75
IPP=`/sbin/ifconfig |grep "inet addr"|awk '{print $2}'|sed -n 1p|awk '{print substr($0,6)}'`
df -H | awk 'NF==1{a=$0;next} NF >1 { a=(a?a" "$0:$0) ; print a;a=""}' | grep -vE '^Filesystem|tmpfs' | awk '{ print $5 " " $6 }' | while read output;
do
  echo $output
AUDIT=$(echo $output  | grep /var/log/audit |awk '{ print $1}' | cut -d'%' -f1  )
if [ “x$AUDIT” != “x” ]; then
if [ $AUDIT -ge $ALERT ]; then
tar -cvzf  /srv/ipengine360ms/audit.`date +%F`.tgz   /var/log/audit/*
if
find  /var/log/audit/*.log.* -mmin +45 -exec rm {} \;
then
echo "fileystem cleaned now... /var/log/audit  `df -Th |grep /var/log/audit |awk '{ print $5}'`" > /tmp/out
mail -s "Backup audit log failed `hostname` $IPP" platform_steadystate_team@cgi.com < /tmp/out
fi
fi
fi
done
