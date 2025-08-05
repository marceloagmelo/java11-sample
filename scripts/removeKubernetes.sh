#!/usr/bin/env bash

echo "Removendo deployments no kubernetes..."
kubectl -n teste delete deployment java11-sample

echo "Removendo services no kubernetes..."
kubectl -n teste delete svc java11-sample-service

echo "Removendo ingress no kubernetes..."
kubectl -n teste delete ingress java11-sample-ingress