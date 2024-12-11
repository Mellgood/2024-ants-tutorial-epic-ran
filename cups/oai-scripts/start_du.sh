#!/bin/bash

cd ../charts/oai-5g-ran/
helm install du oai-du/ -n $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-du --timeout=3m --namespace $1

while [[ $(kubectl logs --namespace $1 $(kubectl get pods --namespace $1 | grep oai-cu-cp| awk '{print $1}') | grep 'Received F1 Setup Request') -lt 1 ]]; do
    echo "Count is less than 1, retrying..."
    sleep 2  # Adjust the sleep time as needed
done

while [[ $(kubectl logs --namespace $1 $(kubectl get pods --namespace $1 | grep oai-amf| awk '{print $1}') | grep 'Connected') -lt 1 ]]; do
    echo "Count is less than 1, retrying..."
    sleep 2  # Adjust the sleep time as needed
done
