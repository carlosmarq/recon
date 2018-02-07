# recon
A shell script to automate recon phase for a domain/company in Internet, using recon-ng v4.9.3, by Tim Tomes (@LaNMaSteR53).
The original idea and source script is credit of Dhayalan96 https://raw.githubusercontent.com/Dhayalan96/enumall/master/enumall.sh

Usage: 
Run as bash:
./enum2all.sh Domain.com Company

Output: 
Three files with the recon-ng output information will be generated:
domain.csv in the execution path
domain.html in the execution path
$domain$stamp.log in recon-ng path

Notes: 
Please note that recon-ng path in the script is /opt/recon-ng/. Modify if your instalation is path is different.

Multiple key must be installed to get the best of recon-ng. For this script the following keys are required:
bing_api google_api google_cse shodan_api builtwith_ap github_api ipinfodb_api twitter_api
