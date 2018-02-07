#!/bin/bash
#Tested in [recon-ng v4.9.3, Tim Tomes (@LaNMaSteR53)]

#Original idea and source Dhayalan96: https://raw.githubusercontent.com/Dhayalan96/enumall/master/enumall.sh

# Modules that needs api’s: (bing_api google_api google_cse shodan_api)

# input from command-line becomes domain to test
domain=$1

#run as bash enum2all.sh Domain.com

#timestamp
stamp=$(date +"%m_%d_%Y")
path=$(pwd)

#create rc file with workspace.timestamp and start enumerating hosts
touch $domain$stamp.resource

echo "spool start $domain$stamp.log" >> $domain$stamp.resource

echo $domain

echo "workspaces select $domain$stamp" >> $domain$stamp.resource
echo "use recon/domains-hosts/bing_domain_web" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/bing_domain_api" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/google_site_api" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/netcraft" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/hackertarget" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/shodan_hostname" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/brute_hosts" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-hosts/certificate_transparency" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

sleep 1

echo "use recon/hosts-hosts/resolve" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/hosts-hosts/reverse_resolve" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/hosts-hosts/bing_ip" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/hosts-hosts/ipinfodb" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/hosts-hosts/freegeoip" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/hosts-hosts/ssltools" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

sleep 1

echo "use recon/domains-contacts/pgp_search" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/domains-contacts/whois_pocs" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use recon/companies-contacts/bing_linkedin_cache" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

sleep 1

echo "use reporting/csv" >> $domain$stamp.resource
echo "set FILENAME $path/$domain.csv" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource

echo "use reporting/html" >> $domain$stamp.resource
echo "set CREATOR cmarquez" >> $domain$stamp.resource
echo "set CUSTOMER $domain" >> $domain$stamp.resource
echo "set FILENAME $path/$domain.html" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource


cd /opt/recon-ng/
./recon-ng --no-check -r $path/$domain$stamp.resource

