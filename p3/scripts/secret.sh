#!/bin/bash
# Retrieve ArgoCD admin password for UI login

echo "🔑 Retrieving ArgoCD admin password..."
# Extract and decode the initial admin password from Kubernetes secret
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo