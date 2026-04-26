#!/usr/bin/env bash
set -euo pipefail

kind create cluster --name secure-platform --config deploy/kind/kind-config.yaml || true
kubectl cluster-info --context kind-secure-platform
