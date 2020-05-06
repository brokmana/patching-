#!/bin/bash
#if space less than 750 then the following commands will be executed
rm -rf /var/cache/yum/x86_64/6Server/*
yum clean all
rm -rf /tmp/ds_agent
mv /var/opt/ds_agent /tmp
