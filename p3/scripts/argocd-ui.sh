#!/bin/bash
# Start port-forwarding to access ArgoCD UI locally

echo "🌐 Starting ArgoCD UI port-forwarding (localhost:9000)..."
# Forward ArgoCD server port to localhost:9000 for web UI access
kubectl port-forward -n argocd svc/argocd-server 9000:443 > /dev/null 2>&1