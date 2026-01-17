#!/bin/bash

kubectl create ns chaos-testing || true

helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

helm install chaos-mesh chaos-mesh/chaos-mesh \
  --namespace chaos-testing \
  --set dashboard.create=true \
  --set controllerManager.allowHostNetwork=true \
  --set chaosDaemon.runtime=containerd \
  --set chaosDaemon.socketPath=/run/containerd/containerd.sock

