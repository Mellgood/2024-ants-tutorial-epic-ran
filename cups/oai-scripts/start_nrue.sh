#!/bin/bash

cd ../charts/oai-5g-ran/

helm install nrue oai-nr-ue/ --namespace $1
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-nr-ue --timeout=3m --namespace $1
sleep 10
kubectl exec -it -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- ifconfig oaitun_ue1 |grep -E '(^|\s)inet($|\s)' | awk {'print $2'}
kubectl exec -it -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- ping -c 5 12.1.1.1
kubectl exec -it -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- apt update
kubectl exec -it -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- apt install iperf3 -y
#kubectl exec -it -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- iperf3 -s
nohup kubectl exec -n $1 -c nr-ue $(kubectl get pods -n $1 | grep oai-nr-ue | awk '{print $1}') -- iperf3 -s > /dev/null 2>&1 &
echo "wait 60 seconds to collect power usage on rest..."
sleep 30
echo "30"
sleep 15
echo "15"
sleep 5 
echo "10"
sleep 5
echo "5"
sleep 5
kubectl exec -it -n $1 $(kubectl get pods -n $1 -o name | grep 'oai-upf') -- /bin/bash -c "apt update && apt install iperf3 -y"
kubectl exec -it -n $1 $(kubectl get pods -n $1 -o name | grep 'oai-upf') -- /bin/bash -c "iperf3 -c 12.1.1.100 -t 90"
