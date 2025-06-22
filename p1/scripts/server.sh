#!/bin/bash
# K3S server setup script - installs and configures K3S server node

echo "🔄 Updating system packages..."
apt-get update && apt-get install net-tools

echo "🚀 Installing K3S server..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --flannel-iface eth1

echo "🔧 Configuring K3S permissions..."
chmod 644 /etc/rancher/k3s/k3s.yaml

echo "💾 Saving node token for workers..."
mkdir -p /vagrant/confs && cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/

echo "✅ K3S server setup complete!"
