#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <namespace>"
    exit 1
fi

NAMESPACE=$1

#cd oai-scripts
cd oai-scripts
./start_core.sh $1
sleep 20
./check_smf.sh $1
./check_upf.sh $1
./start_gnb.sh $1
./start_nrue.sh $1
