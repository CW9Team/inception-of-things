#!/bin/bash

apt-get update && apt-get install net-tools
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --flannel-iface eth1
chmod 644 /etc/rancher/k3s/k3s.yaml
mkdir -p /vagrant/confs && cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/
