
## _OAI-5G deployment using Helm Charts_

OAI 5G deployments covers all the 3 scenarios of RAN, they are:

- Monolithic
- Disaggregated
- CUPS



## Installation - Monolithic

```
git clone git@github.com:futuregnetworks/OAI-5g_Deployment_HC.git
```

```
cd monolithic
```

```
kubectl create ns mono
```

```
./deploy_oai.sh mono
```

This will deploy the monolithic scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test


## Installation - Disaggregated

```
git clone git@github.com:futuregnetworks/OAI-5g_Deployment_HC.git
```

```
cd disaggregated
```

```
kubectl create ns dis
```

```
./deploy_oai.sh dis
```

This will deploy the disaggregated scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test

## Installation - CUPS

```
git clone git@github.com:futuregnetworks/OAI-5g_Deployment_HC.git
```

```
cd cups
```

```
kubectl create ns cups
```

```
./deploy_oai.sh cups
```

This will deploy the cups scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test

