#!/bin/bash
helm uninstall -n $1 $(helm list -aq -n $1)

