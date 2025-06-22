#!/bin/bash
# K3S worker setup script - joins worker node to K3S cluster

echo "🔄 Updating system packages..."
apt-get update && apt-get install net-tools

echo "🔑 Reading cluster token..."
K3S_TOKEN=$(cat /vagrant/confs/node-token)

echo "🔗 Joining K3S cluster as worker..."
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$K3S_TOKEN sh -s - --flannel-iface eth1

echo "✅ K3S worker joined cluster successfully!"