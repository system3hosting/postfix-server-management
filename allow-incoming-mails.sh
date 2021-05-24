echo "Deleting Rules"
iptables -D incoming-mail 2
iptables -D incoming-mail 1
echo "Adding Rules to Open Port 25"
iptables -A incoming-mail -p udp --dport 25 -j ACCEPT
iptables -A incoming-mail -p tcp --dport 25 -j ACCEPT 
echo "Saving and Starting Services"
service iptables save 
service iptables restart
echo "Incoming Mail Service Started"
