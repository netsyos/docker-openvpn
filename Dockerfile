FROM netsyos/base:latest

RUN apt-get -y install openvpn

RUN mkdir /etc/service/openvpn
ADD service/openvpn.sh /etc/service/openvpn/run
RUN chmod +x /etc/service/openvpn/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
