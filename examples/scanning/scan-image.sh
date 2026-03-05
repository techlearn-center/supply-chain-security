#!/bin/bash
# Scan container images for vulnerabilities
echo "=== Vulnerability Scanning ==="

IMAGE="${1:-nginx:latest}"

# Scan with Trivy
echo "--- Trivy Scan ---"
trivy image $IMAGE --severity HIGH,CRITICAL

# Scan with Grype
echo "--- Grype Scan ---"
command -v grype && grype $IMAGE --only-fixed

echo "Scan complete. Review findings above."
