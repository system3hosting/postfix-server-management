# postfix-server-management
I manage a few postfix servers, and these scripts are to help me manage my day to day activity

There are various files in this Repository

1. mailer-daemon-delete.sh
2. delete-emails-containing-address.sh


# mailer-daemon-delete.sh
Use this Script to Delete all mails from MAILER-DAEMON

# delete-emails-containing-address.sh
Use this Script to Delete Emails, that contain the email address given on the command line. Even a Partial email address such as

sh delete-emails-containing-address.sh dummydomain.com 
will delete all email id's from or to domain dummydomain.com
similarly

sh delete-emails-containing-address.sh user@dummydomain.com
will delete all emails from or to user@dummydomain.com in the Mail Queue
