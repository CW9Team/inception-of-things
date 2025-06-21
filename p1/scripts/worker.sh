#!/bin/bash
apt-get update && apt-get install net-tools
K3S_TOKEN=$(cat /vagrant/confs/node-token)
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$K3S_TOKEN sh -s - --flannel-iface eth1