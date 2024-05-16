#!/data/data/com.termux/files/usr/bin/bash
clear
green='\e[1;32m'
cyan='\e[1;36m'
red='\e[1;31m'
blue='\e[1;34m'
white='\e[1;37m'
yellow='\e[1;33m'
black='\e[30m'
nc='\e[0m'
function logo() {
clear
echo -e $red" _    _______ ____ $cyan"A"$white"u"$blue"t"$green"h"$yellow"o"$cyan"r" $red"B"$red"y" $white"de"$cyan"@"$white"hdies""
echo -e $yellow"| |  / / ___// __ \ $green Vulnerability"
echo -e $green"| | / /\__ \/ /_/ /$yellow    Scanners"
echo -e $blue"| |/ /___/ / ____/$red Pentest$white"
echo -e $white"|___________/$cyan ____  __   _____"
cat << "EOF"
*/_  __/ __ \/ __ \/ /  / ___/
**/ /*/ / / / / / / /   \__ \
*/ /*/ /_/ / /_/ / /______/ /
/_/**\____/\____/_____/____/
EOF
echo -e $white"====================================="
}
function _spinner() {
case $1 in
start)
i=1
sp[0]='▁▂▃▄▅▆▇█▇▆▅▄▃▂▁'
sp[1]='▖▘▝▗'
sp[2]='⣾⣽⣻⢿⡿⣟⣯⣷'
sp[3]='◐◓◑◒'
sp[4]='◢◣◤◥'
sp[5]='▉▊▋▌▍▎▏▎▍▌▋▊▉'
rand=$[ $RANDOM % 5 ]
sp=${sp[$rand]}
delay=${SPINNER_DELAY:-0.05}
while :
do
printf "$black${sp:i++%${#sp}:1}$nc\b"
sleep $delay
done
;;
stop)
if [[ -z ${3} ]]; then
echo -e $red "ERROR!!!"
exit 1
fi
kill $3 > /dev/null 2>&1
if [[ $2 -eq 0 ]]; then
echo -en "\b"
else
echo -en "\b"
fi
;;
*)
echo -e $red"ERROR!!!"
exit 1
;;
esac
}
function start_spinner {
_spinner "start" "${1}" &
_sp_pid=$!
disown
}
function stop_spinner {
_spinner "stop" $1 $_sp_pid
unset _sp_pid
}
function back() {
echo -e $white"====================================="$yellow
read -p "TAP ENTER To Back Main Menu!" enter
bash vsp.sh
}
function checkF() {
file=$file
if [ ! -e "$file" ]; then
echo -e $red"File Not Found!"
back
else
echo -e $white
fi
}
function checkM() {
if [[ $choose =~ ^[+-]?[0-9]+$ ]]; then
echo
elif [[ $choose =~ ^[+-]?[0-9]+\.$ ]]; then
echo
elif [[ $choose =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
echo
else
echo -e $red"Wrong Input!"
back
fi
}
echo -e $red" _    _______ ____"
echo -e $yellow"| |  / / ___// __ \ $green Vulnerability"
echo -e $green"| | / /\__ \/ /_/ /$yellow    Scanners"
echo -e $blue"| |/ /___/ / ____/$red Pentest$white"
echo -e $white"|___________/$cyan ____  __   _____"
cat << "EOF"
*/_  __/ __ \/ __ \/ /  / ___/
**/ /*/ / / / / / / /   \__ \
*/ /*/ /_/ / /_/ / /______/ /
/_/**\____/\____/_____/____/
EOF
echo -e $white"==============="
echo -e $white"= "$red"M"$yellow"A"$green"I"$blue"N" $cyan"M"$white"E"$red"N"$yellow"U" $white": ="
echo -e $white"==============="
echo -e $red"[$yellow 01$red ]$white Whois"
echo -e $red"[$green 02$red ]$white Test Ping"
echo -e $red"[$blue 03$red ]$white Page Links"
echo -e $red"[$cyan 04$red ]$white DNS Lookup"
echo -e $red"[$yellow 05$red ]$white Host To IP"
echo -e $red"[$green 06$red ]$white IP To Host"
echo -e $red"[$blue 07$red ]$white Host Search"
echo -e $red"[$cyan 08$red ]$white Reverse DNS"
echo -e $red"[$yellow 09$red ]$white HTTP Headers"
echo -e $red"[$green 10$red ]$white Check Your IP"
echo -e $red"[$blue 11$red ]$white Subnet Lookup"
echo -e $red"[$cyan 12$red ]$white Banner Lookup"
echo -e $red"[$yellow 13$red ]$white Nmap Port Scan"
echo -e $red"[$green 14$red ]$white MTR Traceroute"
echo -e $red"[$blue 15$red ]$white Analytics Lookup"
echo -e $red"[$cyan 16$red ]$white Reverse IP Lookup"
echo -e $red"[$yellow 17$red ]$white Zone Transfer Test"
echo -e $red"[$green 18$red ]$white Geo IP Location Lookup"
echo -e $red"[$blue 19$red ]$white Find Shared DNS Servers"
echo -e $red"[$cyan 20$red ]$white Autonomous System Lookup"
echo -e $red"[$yellow 21$red ]$white Bulk ASN Lookup Mass Checker"
echo -e $red"[$green 22$red ]$white Bulk IPs Scanner Mass Checker"
echo -e $red"[$blue 23$red ]$white Bulk HTTP Headers Mass Checker"
echo -e $red"[$red 00$red ]$white EXIT"
echo -e $white"====================================="$green
read -p "Choose : " choose
checkM
if [ $choose = 1 ]
then logo
echo -e $green"[ 01 ] Whois"$white
read -p "Insert Site or IP : " whois
echo -e "Target $white>$blue $whois"
start_spinner
whois=$(curl -s https://api.hackertarget.com/whois/?q=$whois)
stop_spinner $?
echo "$whois"
back
fi
if [ $choose = 2 ]
then logo
echo -e $green"[ 02 ] Test Ping"$white
read -p "Insert Site or IP : " nping
echo -e "Target $white>$blue $nping"
start_spinner
nping=$(curl -s https://api.hackertarget.com/nping/?q=$nping)
stop_spinner $?
echo "$nping"
back
fi
if [ $choose = 3 ]
then logo
echo -e $green"[ 03 ] Page Links"$white
read -p "Insert Site or IP : " pagelinks
echo -e "Target $white>$blue $pagelinks"
start_spinner
pagelinks=$(curl -s https://api.hackertarget.com/pagelinks/?q=$pagelinks)
stop_spinner $?
echo "$pagelinks"
back
fi
if [ $choose = 4 ]
then logo
echo -e $green"[ 04 ] DNS Lookup"$white
read -p "Insert Site or IP : " dnslookup
echo -e "Target $white>$blue $dnslookup"
start_spinner
dnslookup=$(curl -s https://api.hackertarget.com/dnslookup/?q=$dnslookup)
stop_spinner $?
echo "$dnslookup"
back
fi
if [ $choose = 5 ]
then logo
echo -e $green"[ 05 ] Host To IP"$white
read -p "Insert Host Target : " targetip
echo -e "Target $white>$blue $targetip"
start_spinner
hostoip=$(host $targetip)
stop_spinner $?
echo "$hostoip"
back
fi
if [ $choose = 6 ]
then logo
echo -e $green"[ 06 ] IP To Host"$white
read -p "Insert IP Target : " targets
echo -e "Target $white>$blue $targets"$white
read -p "Save Output File Target : " outfile
start_spinner
ip2hosts=$({
rm $outfile 2>/dev/null
curl -ks https://freeapi.robtex.com/ipquery/$targets | grep -Po "(?<=\"o\":).*?(?=,)" | sed 's/\"//g' >> $outfile
curl "http://www.virustotal.com/vtapi/v2/ip-address/report?ip=$targets&apikey=3c052e9a7339f3a73f00bd67baea747e47f59ee6c1596e59590fd953d00ce519" -s | grep -Po "(?<=hostname\": \").*?(?=\")" >> $outfile
curl "http://www.virustotal.com/vtapi/v2/ip-address/report?ip=$targets&apikey=3c052e9a7339f3a73f00bd67baea747e47f59ee6c1596e59590fd953d00ce519" -s | grep -Po "(?<=hostname\": \").*?(?=\")" >> $outfile
dig +short -x $targets 2>&1 | grep -v "connection timed out" >> $outfile
curl -ks "https://www.bing.com/search?q=ip%3a$targets" | grep -Po "(?<=<a href=\").*?(?= h=)" | grep -Po "(?<=://).*?(?=/)" | grep -E -v "microsoft|bing|pointdecontact" >> $outfile
nmap -p443 -Pn --script ssl-cert $targets | grep Subject | grep -Po "(?<=commonName=).*?(?=/)" | tr '[:upper:]' '[:lower:]' >> $outfile
sed -i 's/\.$//g' $outfile
curl -X POST -F "remoteAddress=$targets"  http://domains.yougetsignal.com/domains.php -s | grep -Poz "(?s)\[.*\]" | cat -v | grep -Po "(?<=\").+(?=\")" >> $outfile
curl -ks "https://www.threatcrowd.org/graphHtml.php?ip=$targets" | grep -Po "(?<=id: ').*?(?=')" | grep -v  ^[0-9] | grep -v @ >> $outfile
curl -s "https://www.pagesinventory.com/ip/$targets" | grep -Po "(?<=<a href=\"/domain/).*?(?=\.html)" >> $outfile
sort -u $outfile
})
stop_spinner $?
echo "$ip2hosts"
echo -e $white"====================================="$yellow
echo -e $green"File Save To Name $outfile"$yellow
read -p "TAP ENTER To Back Main Menu!" enter
bash vsp.sh
fi
if [ $choose = 7 ]
then logo
echo -e $green"[ 07 ] Host Search"$white
read -p "Insert Site or IP : " hostsearch
echo -e "Target $white>$blue $hostsearch"
start_spinner
hostsearch=$(curl -s https://api.hackertarget.com/hostsearch/?q=$hostsearch)
stop_spinner $?
echo "$hostsearch"
back
fi
if [ $choose = 8 ]
then logo
echo -e $green"[ 08 ] Reverse DNS"$white
read -p "Insert Site or IP : " reversedns
echo -e "Target $white>$blue $reversedns"
start_spinner
reversedns=$(curl -s https://api.hackertarget.com/reversedns/?q=$reversedns)
stop_spinner $?
echo "$reversedns"
back
fi
if [ $choose = 9 ]
then logo
echo -e $green"[ 09 ] HTTP Headers"$white
read -p "Insert Site or IP : " httpheaders
echo -e "Target $white>$blue $httpheaders"
start_spinner
httpheaders=$(curl -s https://api.hackertarget.com/httpheaders/?q=$httpheaders)
stop_spinner $?
echo "$httpheaders"
back
fi
if [ $choose = 10 ]
then logo
echo -e $green"[ 10 ] Check Your IP"$white
start_spinner
urip=$(curl -s https://api.ipify.org)
stop_spinner $?
echo -e "Your IP Adress :$blue $urip"
back
fi
if [ $choose = 11 ]
then logo
echo -e $green"[ 11 ] Subnet Lookup"$white
read -p "Insert Site or IP : " subnetcalc
echo -e "Target $white>$blue $subnetcalc"
start_spinner
subnetcalc=$(curl -s https://api.hackertarget.com/subnetcalc/?q=$subnetcalc)
stop_spinner $?
echo "$subnetcalc"
back
fi
if [ $choose = 12 ]
then logo
echo -e $green"[ 12 ] Banner Lookup"$white
read -p "Insert CIDR IP : " bannerlookup
echo -e "Target $white>$blue $bannerlookup"
start_spinner
bannerlookup=$(curl -s https://api.hackertarget.com/bannerlookup/?q=$bannerlookup)
stop_spinner $?
echo "$bannerlookup"
back
fi
if [ $choose = 13 ]
then logo
echo -e $green"[ 13 ] Nmap Port Scan"$white
read -p "Insert Site or IP : " nmap
echo -e "Target $white>$blue $nmap"
start_spinner
nmap=$(curl -s https://api.hackertarget.com/nmap/?q=$nmap)
stop_spinner $?
echo "$nmap"
back
fi
if [ $choose = 14 ]
then logo
echo -e $green"[ 14 ] MTR Traceroute"$white
read -p "Insert Site or IP : " mtr
echo -e "Target $white>$blue $mtr"
start_spinner
mtr=$(curl -s https://api.hackertarget.com/mtr/?q=$mtr)
stop_spinner $?
echo "$mtr"
back
fi
if [ $choose = 15 ]
then logo
echo -e $green"[ 15 ] Analytics Lookup"$white
read -p "Insert Site or IP : " analyticslookup
echo -e "Target $white>$blue $analyticslookup"
start_spinner
analyticslookup=$(curl -s https://api.hackertarget.com/analyticslookup/?q=$analyticslookup)
stop_spinner $?
echo "$analyticslookup"
back
fi
if [ $choose = 16 ]
then logo
echo -e $green"[ 16 ] Reverse IP Lookup"$white
read -p "Insert Site or IP : " reverseiplookup
echo -e "Target $white>$blue $reverseiplookup"
start_spinner
reverseiplookup=$(curl -s https://api.hackertarget.com/reverseiplookup/?q=$reverseiplookup)
stop_spinner $?
echo "$reverseiplookup"
back
fi
if [ $choose = 17 ]
then logo
echo -e $green"[ 17 ] Zone Transfer Test"$white
read -p "Insert Site or IP : " zonetransfer
echo -e "Target $white>$blue $zonetransfer"
start_spinner
zonetransfer=$(curl -s https://api.hackertarget.com/zonetransfer/?q=$zonetransfer)
stop_spinner $?
echo "$zonetransfer"
back
fi
if [ $choose = 18 ]
then logo
echo -e $green"[ 18 ] Geo IP Location Lookup"$white
read -p "Insert Site or IP : " geoip
echo -e "Target $white>$blue $geoip"
start_spinner
geoip=$(curl -s https://api.hackertarget.com/geoip/?q=$geoip)
stop_spinner $?
echo "$geoip"
back
fi
if [ $choose = 19 ]
then logo
echo -e $green"[ 19 ] Find Shared DNS Servers"$white
read -p "Insert Site or IP : " findshareddns
echo -e "Target $white>$blue $findshareddns"
start_spinner
findshareddns=$(curl -s https://api.hackertarget.com/findshareddns/?q=$findshareddns)
stop_spinner $?
echo "$findshareddns"
back
fi
if [ $choose = 20 ]
then logo
echo -e $green"[ 20 ] Autonomous System Lookup"$white
read -p "Insert AS Name Target : " aslookup
echo -e "Target $white>$blue $aslookup"
start_spinner
aslookup=$(curl -s https://api.hackertarget.com/aslookup/?q=$aslookup)
stop_spinner $?
echo "$aslookup"
back
fi
if [ $choose = 21 ]
then logo
echo -e $green"[ 21 ] Bulk ASN Lookup Mass Checker"$white
read -p "Insert ASN File Target : " file
checkF
echo -e "Target $white>$blue $file"$white
read -p "Save Output File Target : " outfile
while read asn; do
start_spinner
asn=$(nmap --script targets-asn --script-args targets-asn.asn=$asn | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,3\}')
stop_spinner $?
echo "$asn"
cat >> $outfile <<EOF
$asn
EOF
done < $file
echo -e $white"====================================="$yellow
echo -e $green"File Save To Name $outfile"$yellow
read -p "TAP ENTER To Back Main Menu!" enter
bash vsp.sh
fi
if [ $choose = 22 ]
then logo
echo -e $green"[ 22 ] Bulk IPs Scanner Mass Checker"$white
read -p "Insert CIDR File Target : " file
checkF
echo -e "Target $white>$blue $file"$white
read -p "Save Output File Target : " outfile
while read ips; do
start_spinner
ips=$(nmap -sL -n $ips | grep 'Nmap scan report for' | cut -f 5 -d ' ')
stop_spinner $?
echo "$ips"
cat > $outfile <<EOF
$ips
EOF
done < $file
echo -e $white"====================================="$yellow
echo -e $green"File Save To Name $outfile"$yellow
read -p "TAP ENTER To Back Main Menu!" enter
bash vsp.sh
fi
if [ $choose = 23 ]
then logo
echo -e $green"[ 23 ] Bulk HTTP Headers Mass Checker"$white
read -p "Insert IPs File Target : " file
checkF
echo -e "Target $white>$blue $file"$white
read -p "Save Output File Target : " outfile
echo -e $white"_____________________________________"
echo -e  $green"Status           "$cyan"IP/Host"
echo -e $white"-------------------------------------"
while read bulk; do
start_spinner
bulk=$(curl -o /dev/null/ --max-time 2 --silent -XGET --write-out "[ %{http_code} ]    >    $bulk\n" $bulk)
stop_spinner $?
echo "$bulk"
cat >> $outfile <<EOF
$bulk
EOF
done < $file
echo -e $white"====================================="$yellow
echo -e $green"File Save To Name $outfile"$yellow
read -p "TAP ENTER To Back Main Menu!" enter
bash vsp.sh
fi
if [ $choose = 0 ]
then logo
echo -e $white"= $red"T"$yelow"h"$green"a"$blue"n"$cyan"k"$white"s" $red"F"$yellow"o"$green"r" $blue"U"$cyan"s"$white"i"$red"n"$yellow"g" $green"T"$blue"h"$cyan"i"$white"s" $red"T"$yellow"o"$green"o"$blue"l"$cyan"s"$white..! :) ="
echo -e $white"====================================="
exit
fi
