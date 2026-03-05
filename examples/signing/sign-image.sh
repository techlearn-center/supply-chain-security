#!/bin/bash
# Sign container images with cosign
echo "=== Signing Container Image ==="

# Install cosign
command -v cosign || go install github.com/sigstore/cosign/v2/cmd/cosign@latest

# Generate a key pair (first time only)
# cosign generate-key-pair

# Sign an image
IMAGE="localhost:5000/myapp:v1.0"
docker build -t $IMAGE .
docker push $IMAGE

# Sign with cosign
cosign sign --key cosign.key $IMAGE

# Verify the signature
cosign verify --key cosign.pub $IMAGE

echo "Image signed and verified successfully!"
