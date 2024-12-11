# 2024-ants-tutorial-epic-ran

This is the official repository for ANTS 2024 "EPIC-RAN: Evaluating Power in Container Clouds for Open Radio Access Networks" tutorial.

## OAI-5G deployment using Helm Charts

OAI 5G deployments covers all the 3 scenarios of RAN, they are:

- Monolithic
- Disaggregated
- CUPS

## Installation - Monolithic

```bash
git clone https://github.com/Mellgood/2024-ants-tutorial-epic-ran.git
```

```bash
cd monolithic
```

```bash
kubectl create ns mono
```

```bash
./deploy_oai.sh mono
```

This will deploy the monolithic scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test


## Installation - Disaggregated

```bash
git clone https://github.com/Mellgood/2024-ants-tutorial-epic-ran.git
```

```bash
cd disaggregated
```

```bash
kubectl create ns dis
```

```bash
./deploy_oai.sh dis
```

This will deploy the disaggregated scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test

## Installation - CUPS

```bash
git clone https://github.com/Mellgood/2024-ants-tutorial-epic-ran.git
```

```bash
cd cups
```

```bash
kubectl create ns cups
```

```bash
./deploy_oai.sh cups
```

This will deploy the cups scenario, and it is successful if there is a ping from UE to CN, i.e, if this script executes successfully. iperf3 is installed in the UE as a part of this script.

Install iperf3 in upf and do the stress test
