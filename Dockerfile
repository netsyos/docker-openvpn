FROM netsyos/base:latest

RUN apt-get -y install openvpn

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
