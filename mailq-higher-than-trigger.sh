#!/bin/bash
MAILQ="$(mailq | tail -1  | awk '{print $5}')"
MDMAILS="$(mailq | grep MAILER-DAEMON | wc -l)"
THIRDMAILQ=$(($MAILQ/3))
if [ $MDMAILS \> $THIRDMAILQ ];
then
	echo "Mailer Daemon Mails are "$MDMAILS", which is nearly Third of Total Mail Queue of" $MAILQ;
	echo "Will now Process Command to delete Mailer Daemon Emails";
mailq | tail -n +2 | grep -v '^ *(' | awk  'BEGIN { RS = "" }
# $7=sender, $8=recipient1, $9=recipient2
{ if ($7 == "MAILER-DAEMON" )
    print $1 }
' | tr -d '*!' | postsuper -d -
MAILQ="$(mailq | tail -1  | awk '{print $5}')"
MDMAILS="$(mailq | grep MAILER-DAEMON | wc -l)"
	echo "Now Mail Queue is" $MAILQ "and Mailer Daemon Mails are" $MDMAILS "";
else
	echo "Mailer Daemon Mails only" $MDMAILS "While Mail Queue is" $MAILQ "";
fi;
OLDESTEMAIL="$(postqueue -p | head -2 | tail -1 | awk '{ print $4, $5 }')"
echo "Currently the Oldest Email in Queue is from" $OLDESTEMAIL;
