#! /usr/bin/env bash

# Setup script to turn an ubuntu droplet into an openvpn server.
# Configurable with env variables:
#   SERVER_IP: ip address/domain name of the droplet (required to create .ovpn file)
#   SERVER_PORT: port for the openvpn server (default 1194)

# https://github.com/kylemanna/docker-openvpn
# https://docs.docker.com/install/linux/docker-ce/ubuntu

if [ -n "${SERVER_IP+1}" ]; then
    TAG=tunnel
    DATA=ovpn-data-$TAG
    CLIENT=droplet
    PORT=1194
    SERVER=$SERVER_IP

    apt-get update
    apt-get upgrade -y
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-get update
    apt-get install -y docker-ce

    # Create a docker container to hold config files and certificates.
    docker volume create --name $DATA
    docker run -v $DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u tcp://$SERVER:$PORT
    docker run -v $DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

    # Generate client certificate without passphrase.
    docker run -v $DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENT nopass

    # Retrieve the client configuration with embedded certificates.
    docker run -v $DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $CLIENT > ~/$CLIENT.ovpn

    # Provide a systemd file for docker-openvpn access.
    curl -L https://raw.githubusercontent.com/kylemanna/docker-openvpn/master/init/docker-openvpn%40.service | tee /etc/systemd/system/docker-openvpn@.service

    # Configure systemd unit according to our needs.
    mkdir /etc/systemd/system/docker-openvpn@.service.d/
    cat > /etc/systemd/system/docker-openvpn@.service.d/env.conf << EOL
[Service]
Environment="PORT=$PORT:1194/tcp"
EOL

    # Explain usage.
    echo "Control docker-openvpn using 'docker-openvpn@${TAG}.service'"
else
    echo 'Set $SERVER_IP to use this script'
fi
