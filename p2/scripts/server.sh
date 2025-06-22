#!/bin/bash
# K3S server setup script - installs K3S and deploys applications

echo "🔄 Updating system packages..."
apt-get update && apt-get install net-tools

echo "🚀 Installing K3S server..."
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --flannel-iface eth1

echo "🔧 Configuring K3S permissions..."
chmod 644 /etc/rancher/k3s/k3s.yaml

echo "📦 Deploying applications..."
kubectl apply -f confs/app1.yaml -f confs/app2.yaml -f confs/app3.yaml -f confs/ingress.yaml

echo "✅ K3S server and applications deployed successfully!"