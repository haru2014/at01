#!/usr/bin/env bash
set -e

echo "=== Dev-Workstation One-Click Reproduce Script ==="
echo "[Step 1] Building Docker custom image (my-dev-web:1.0)..."
docker build -t my-dev-web:1.0 .

echo "[Step 2] Cleaning up any previous test container..."
docker rm -f my-web-8080 2>/dev/null || true

echo "[Step 3] Running container with port mapping (-p 8080:80)..."
docker run -d --name my-web-8080 -p 8080:80 my-dev-web:1.0

echo "[Step 4] Checking container status..."
docker ps --filter "name=my-web-8080"

echo "[Step 5] Testing HTTP connection..."
sleep 1
curl -s http://localhost:8080 | grep "Hello Codyssey" && echo ">>> Verified successfully! <<<"
