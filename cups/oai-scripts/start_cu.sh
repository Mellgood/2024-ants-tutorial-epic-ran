#!/bin/bash

cd ../charts/oai-5g-ran/
helm install cucp oai-cu-cp --namespace $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-cu-cp --namespace $1 --timeout=3m
helm install cuup oai-cu-up --namespace $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-cu-up --namespace $1 --timeout=3m
#kubectl logs --namespace $1 $(kubectl get pods --namespace $1 | grep oai-cu-cp| awk '{print $1}') | grep 'Accepting new CU-UP ID'
#echo "CP, UP Deployed"
while [[ $(kubectl logs --namespace $1 $(kubectl get pods --namespace $1 | grep oai-cu-cp| awk '{print $1}') | grep 'Accepting new CU-UP ID') -lt 1 ]]; do
    echo "Count is less than 1, retrying..."
    sleep 2  # Adjust the sleep time as needed
done
