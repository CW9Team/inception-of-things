#!/bin/bash
# Configure ArgoCD server service for external access

echo "🔧 Configuring ArgoCD server as NodePort for UI access..."
# Change ArgoCD server service type to NodePort for external access
kubectl patch service argocd-server -n argocd --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'