#!/bin/bash
MAILQ="$(mailq | tail -1  | awk '{print $5}')"
TOPRECIPIENTMAILS="$(mailq | awk '{print $1}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $1}')"
TOPRECIPIENT="$(mailq | awk '{print $1}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $2}')"
echo "Total Mails in Mail Queue are "$MAILQ" out of which "$TOPRECIPIENTMAILS" are from/to "$TOPRECIPIENT;
