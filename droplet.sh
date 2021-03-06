#! /usr/bin/env bash

# Setup script to turn an ubuntu droplet into an openvpn server.
# Configurable with env variables:
#   SERVER_IP: ip address/domain name of the droplet (required to create .ovpn file)
#   SERVER_PORT: port for the openvpn server (default 1194)

# https://github.com/kylemanna/docker-openvpn
# https://docs.docker.com/install/linux/docker-ce/ubuntu

if [ -n "${SERVER_IP+1}" ]; then
    DATA=ovpn-data
    CLIENT=droplet
    PORT="${SERVER_PORT:-1194}"
    SERVER=$SERVER_IP

    apt-get update
    apt-get upgrade -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce

    docker volume create --name $DATA

    docker run -v $DATA:/etc/openvpn \
           --rm kylemanna/openvpn ovpn_genconfig -u tcp://$SERVER:$PORT

    docker run -v $DATA:/etc/openvpn \
           --rm -it kylemanna/openvpn ovpn_initpki

    docker run -v $DATA:/etc/openvpn \
           -d -p $PORT:1194/tcp --cap-add=NET_ADMIN kylemanna/openvpn

    docker run -v $DATA:/etc/openvpn \
           --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENT nopass

    docker run -v $DATA:/etc/openvpn \
           --rm kylemanna/openvpn ovpn_getclient $CLIENT > $CLIENT.ovpn
else
    echo 'Set $SERVER_IP (and optionally $OVPN_DATA and $CLIENT_NAME) to use this script'
fi
