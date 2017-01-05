#!/bin/bash
wget --no-check-certificate -O ./gfwlist.txt https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
gfwlist2pac -i ./gfwlist.txt -f ./proxy-socks.pac -p 'SOCKS5 127.0.0.1:1080; SOCKS 127.0.0.1:1080; DIRECT;' --user-rule ./user_rule.txt
gfwlist2pac -i ./gfwlist.txt -f ./proxy.pac -p 'PROXY 127.0.0.1:8118; DIRECT;' --user-rule ./user_rule.txt
gfwlist2pac -i ./gfwlist.txt -f ./wpad.dat -p 'PROXY 10.10.88.1:8118; DIRECT;' --user-rule ./user_rule.txt
#generate the dnsmasq
#./gfwlist2dnsmasq.sh
#workaround to replace amazon.com to bbc.co.uk
sed -i 's/amazon.com/bbc.co.uk/g' ./proxy.pac ./proxy-socks.pac ./wpad.dat ./dnsmasq_list.conf
sed -i 's/fake-replace-twimg-edgesuite.com/twimg.edgesuite.net/g' ./proxy.pac ./proxy-socks.pac ./wpad.dat ./dnsmasq_list.conf
