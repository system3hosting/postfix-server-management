echo "Deleting Previous Rules"
iptables -D incoming-mail 2
iptables -D incoming-mail 1
echo "Adding Rules to Block Port 25"
iptables -A incoming-mail -p udp --dport 25 -j DROP
iptables -A incoming-mail -p tcp --dport 25 -j DROP
echo "Saving Updatesand Starting Services"
service iptables save 
service iptables restart
echo "Incoming Mail Service is Blocked"
