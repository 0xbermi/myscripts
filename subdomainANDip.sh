#!/bin/bash
curl -fsSL "https://crt.sh/?CN=%25.$1" | sort -n | uniq -c | grep -o -P '(?<=\<TD\>).*(?=\<\/TD\>)' | sed -e '/white-space:normal/d '> $1_subdomain.txt
for domain in $(cat $1_subdomain.txt); do host $domain; done | sort -n | uniq -c | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' > $1_ip.txt
cat $1_ip.txt $1_subdomain.txt
