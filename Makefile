APP_NAME=secure-microservices-supply-chain-platform
NAMESPACE=secure-platform-dev

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make up                - Run services locally (docker-compose)"
	@echo "  make down              - Stop local services"
	@echo "  make test              - Run unit tests"
	@echo "  make kind-bootstrap    - Create local Kubernetes cluster"
	@echo "  make deploy-dev        - Deploy to Kubernetes (dev)"
	@echo "  make delete-dev        - Remove dev deployment"
	@echo "  make scan-config       - Scan IaC and configs"
	@echo "  make scan-image        - Scan container image"
	@echo "  make sbom              - Generate SBOM"
	@echo "  make verify-signature  - Verify container signature"

# -----------------------------
# Local Development
# -----------------------------

up:
	docker compose up --build -d

down:
	docker compose down

test:
	pytest apps/orders-service/tests apps/inventory-service/tests

# -----------------------------
# Kubernetes (kind)
# -----------------------------

kind-bootstrap:
	bash scripts/bootstrap-kind.sh

deploy-dev:
	kubectl apply -k deploy/overlays/dev

delete-dev:
	kubectl delete -k deploy/overlays/dev

# -----------------------------
# Security Scanning
# -----------------------------

scan-config:
	trivy config .

scan-image:
	trivy image orders-service:local

# -----------------------------
# Supply Chain Security
# -----------------------------

sbom:
	syft packages orders-service:local -o spdx-json > security/orders-service-sbom.json

verify-signature:
	bash scripts/verify-signature.sh