#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <namespace>"
    exit 1
fi

NAMESPACE=$1

cd ../charts/oai-5g-core/oai-5g-basic
helm install basic . -n "$NAMESPACE"
kubectl wait --for=condition=ready pod -l app.kubernetes.io/instance=basic --timeout=3m -n "$NAMESPACE"
