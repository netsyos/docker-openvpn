FROM netsyos/base:latest

RUN apt update && apt -y install wget iptables
RUN wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
RUN echo "deb http://build.openvpn.net/debian/openvpn/release/2.5 focal main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
RUN apt update && apt install -y openvpn easy-rsa
RUN mkdir /etc/service/openvpn
ADD service/openvpn.sh /etc/service/openvpn/run
RUN chmod +x /etc/service/openvpn/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
