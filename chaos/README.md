# Chaos Engineering – EKS (Chaos Mesh)

This directory contains Chaos Engineering experiments executed on the EKS clusters
using **Chaos Mesh**. All experiments are environment-aware and follow a strict
promotion model.

---

## Folder Structure


---

## Chaos Promotion Strategy

| Environment | Chaos Scope |
|------------|-------------|
| dev        | Aggressive testing, short duration |
| sit        | Selected chaos scenarios only |
| preprod   | Production-like simulations |
| prod      | Scheduled, approved chaos only |

---

## Supported Chaos Types

- CPU Stress
- Pod Kill
- Network Latency
- DNS Failure
- Node Drain (advanced)

---

## Execution Example (DEV)

```bash
kubectl apply -f chaos/dev/cpu/a2a-cpu-stress.yaml
