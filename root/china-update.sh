#!/bin/sh

# Create the ipset list
ipset -F china 


# Pull the latest IP set for China
wget -O cn.zone -P . http://www.ipdeny.com/ipblocks/data/countries/cn.zone

# Add each IP address from the downloaded list into the ipset 'china'
for i in $(cat cn.zone ); do ipset -A china $i; done

# Pull the latest IP set for China
wget -O hk.zone -P . http://www.ipdeny.com/ipblocks/data/countries/hk.zone

# Add each IP address from the downloaded list into the ipset 'china'
for i in $(cat hk.zone ); do ipset -A china $i; done

# Restore iptables
#/sbin/iptables-restore < /etc/iptables.firewall.rules