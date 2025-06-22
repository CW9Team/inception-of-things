#!/bin/bash
# Main deployment script - sets up K3D cluster and deploys application with ArgoCD

echo "🚀 Setting up K3D cluster with ArgoCD..."
sleep 15

sh setup-k3d-with-argocd.sh

echo "📦 Deploying application..."
sleep 15

kubectl apply -f ../confs/deployment.yaml --wait

echo "⚙️  Configuring ArgoCD application..."
sleep 15
kubectl apply -f ../confs/argo.yaml --wait

echo "🌐 Exposing service..."
sleep 15
kubectl apply -f ../confs/service.yaml --wait


