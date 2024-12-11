#!/bin/bash

cd ../charts/oai-5g-ran/
#cd /home/snsrl4/Documents/raja/oai-cn5g-fed/charts/oai-5g-ran/
helm install gnb oai-gnb/ -n $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-gnb --timeout=3m --namespace $1
sleep 10
kubectl logs --namespace mono $(kubectl get pods --namespace mono | grep oai-amf| awk '{print $1}') | grep 'Connected'
echo "GNB Deployed"
