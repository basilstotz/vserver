for IP in $(cat /proc/net/xt_recent/fail2ban-fail2ban|cut -d\  -f1|cut -d= -f2); do
  ipset test china $IP
done
