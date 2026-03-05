#!/bin/bash
# Generate SBOM using syft
echo "=== Generating SBOM ==="

# Install syft if not present
command -v syft || curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s

# Generate SBOM for a Docker image
syft nginx:latest -o spdx-json > sbom-nginx.spdx.json
syft nginx:latest -o cyclonedx-json > sbom-nginx.cyclonedx.json

echo "SBOM generated in SPDX and CycloneDX formats"
echo "Components found: $(jq '.packages | length' sbom-nginx.spdx.json)"
