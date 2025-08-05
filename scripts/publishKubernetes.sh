#!/usr/bin/env bash

echo "Publicando aplicação no kubernetes..."
awk 'FNR==1 {print "---"}{print}' k8s/*.yaml | envsubst > kub-app.yaml
cat kub-app.yaml
kubectl apply -f kub-app.yaml -n default