#!/bin/bash
# Setup script - installs K3D, creates cluster, and configures ArgoCD

# Check if K3D is installed, install if missing
if which k3d;then
    echo "✅ K3D is already installed"
else
    echo "📥 Installing K3D..."
    wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

# Create K3S cluster with port mapping for service access
echo "🏗️  Creating K3S cluster 'p3'..."
k3d cluster create p3 -p "8081:30001@agent:0" --agents 1

# Create namespaces for application and ArgoCD
echo "📁 Creating namespaces..."
kubectl create ns argocd
kubectl create ns dev

# Install ArgoCD in the argocd namespace
echo "🔧 Installing ArgoCD..."
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -n argocd --wait

echo "✨ Cluster setup complete!"
