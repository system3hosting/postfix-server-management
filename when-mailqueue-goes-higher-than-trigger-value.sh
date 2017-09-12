MAILQ="$(mailq | tail -1  | awk '{print $5}')"
echo "${MAILQ}"
MDMAILS="$(mailq | grep MAILER-DAEMON | wc -l)"
echo "${MDMAILS}"
THIRDMAILQ=$(($MAILQ/3))
if [ $MDMAILS \> $THIRDMAILQ ];
then
	echo "Mailer Daemon Mailes Nearly Third of Mail Queue";
	echo "Will now Process Command to delete Mailer Daemon Emails";
 /root/mailer-daemon-delete.sh
MAILQ="$(mailq | tail -1  | awk '{print $5}')"
MDMAILS="$(mailq | grep MAILER-DAEMON | wc -l)"
	echo "Now Mail Queue is" $MAILQ "and Mailer Daemon Mails are" $MDMAILS "";
else
	echo "Mailer Daemon Mails only" $MDMAILS "While Mail Queue is" $MAILQ "";
fi;
OLDESTEMAIL="postqueue -p | head -2 | tail -1 | awk '{ print $4, $5 }'"
