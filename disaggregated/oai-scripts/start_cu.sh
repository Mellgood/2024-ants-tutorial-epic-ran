#!/bin/bash

cd ../charts/oai-5g-ran/
helm install cu oai-cu/ -n $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-cu --timeout=3m --namespace $1
sleep 10
kubectl logs --namespace $1 $(kubectl get pods --namespace $1 | grep oai-amf| awk '{print $1}') | grep 'Connected'
echo "GNB Deployed"
