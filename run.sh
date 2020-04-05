#!/bin/bash
if [ "$1" == "" ]
then
echo "You forgot an IP address!"
echo "Syntax: ./run.sh 10.10.10.80"
else
mkdir /home/l33t/HTB/"$1";cd /home/l33t/HTB/"$1";
nmap -sC -sV -Pn $1 | tee nmap.txt;
if [ "$(cat nmap.txt | grep '80/tcp open')" != " " ]
then 
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt | tee gobuster.txt
else
echo "No OpeN 80 PoRt"
fi
fi