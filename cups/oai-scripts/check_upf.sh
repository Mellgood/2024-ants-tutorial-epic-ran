#!/bin/bash

NAMESPACE=$1

# Loop until count is >= 2
while [[ $(kubectl logs -l app.kubernetes.io/name=oai-upf -n "$NAMESPACE" | grep -c 'handle_receive(16 bytes)') -lt 1 ]]; do
    echo "Count is less than 1, retrying..."
    sleep 5  # Adjust the sleep time as needed
done

echo "Core-Network is running"
