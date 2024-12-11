#!/bin/bash

cd ../charts/oai-5g-ran/
helm install du oai-du/ -n $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-du --timeout=3m --namespace $1
