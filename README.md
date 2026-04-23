# Microservices-supply-chain-platform
End-to-end DevSecOps platform demonstrating secure build, scan, sign, verify, and deploy workflows for microservices on Kubernetes.


## Overview

This project simulates a production-grade DevSecOps platform where security is embedded across the entire software delivery lifecycle.

It demonstrates how to prevent insecure or untrusted artifacts from reaching runtime by enforcing automated security controls from source code to Kubernetes deployment.

---

## Architecture

The platform consists of:

- **Frontend** (Nginx-based UI)
- **Orders Service** (FastAPI)
- **Inventory Service** (FastAPI)
- **Worker** (background processing)
- **Kubernetes cluster (kind)**
- **GitHub Actions CI/CD pipelines**
- **Container registry (GHCR)**

Security and platform components:

- CI/CD security gates
- SBOM generation
- Image signing and verification
- Policy-as-code enforcement
- Runtime security monitoring
- Observability stack

---

## Security Objectives

This project enforces security controls across five layers:

### 1. Source Security
- Secret detection using Gitleaks
- Code analysis using CodeQL

### 2. Build Security
- Dependency and filesystem scanning with Trivy
- Secure Docker builds with hardened images

### 3. Artifact Security
- SBOM generation using Syft
- Image signing using Cosign

### 4. Deployment Security
- Kubernetes manifest validation
- Policy enforcement using Kyverno
- Restricted container configurations

### 5. Runtime Security
- Workload monitoring
- Detection of anomalous behavior (Falco - planned)

---

## Repository Structure

```text
.
├── apps/          # Microservices (frontend, orders, inventory, worker)
├── deploy/        # Kubernetes manifests and environment overlays
├── infra/         # Terraform infrastructure code
├── policies/      # Kyverno policy-as-code rules
├── security/      # Threat model, playbooks, risk register
├── docs/          # Architecture and operational documentation
├── scripts/       # Helper scripts for local setup and validation
└── .github/       # CI/CD workflows
