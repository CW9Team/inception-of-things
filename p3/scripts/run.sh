#!/bin/bash
# Main deployment script - sets up K3D cluster and deploys application with ArgoCD

echo "🚀 Setting up K3D cluster with ArgoCD..."
sleep 40

sh setup-k3d-with-argocd.sh

echo "📦 Deploying application..."
sleep 40

kubectl apply -f ../confs/deployment.yaml

echo "⚙️  Configuring ArgoCD application..."
sleep 40
kubectl apply -f ../confs/argo.yaml

echo "🌐 Exposing service..."
sleep 40
kubectl apply -f ../confs/service.yaml


