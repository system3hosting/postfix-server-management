#!/bin/bash
mailq | tail -n +2 | grep -v '^ *(' | awk  'BEGIN { RS = "" }
# $7=sender, $8=recipient1, $9=recipient2
{ if ($7 == "MAILER-DAEMON" )
    print $1 }
' | tr -d '*!' | postsuper -d -
