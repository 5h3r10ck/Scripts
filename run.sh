#!/bin/bash
mkdir /home/l33t/HTB/"$1";cd /home/l33t/HTB/"$1";
nmap -sC -sV -Pn $1 > nmap.txt;
if [cat nmap.txt; grep "80/tcp open"] !== ""
then 
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt > gobuster.txt
else
echo "No OpeN 80 PoRt"
fi