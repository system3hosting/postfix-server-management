#!/bin/bash
MAILQ="$(mailq | tail -1  | awk '{print $5}')"
TOPRECIPIENTMAILS="$(mailq | awk '{print $1}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $1}')"
TOPSENDER="$(mailq | awk '{print $7}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $2}')"
TOPSENDERMAILS="$(mailq | awk '{print $7}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $1}')"
TOPRECIPIENT="$(mailq | awk '{print $1}' | grep @ | uniq -c | sort -nr | head -1 | awk '{print $2}')"
echo "Total Mails in Mail Queue are "$MAILQ" out of which "$TOPRECIPIENTMAILS" are to "$TOPRECIPIENT "and "$TOPSENDERMAILS "mails are from "$TOPSENDER;
