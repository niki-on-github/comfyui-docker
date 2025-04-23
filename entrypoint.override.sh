#!/bin/bash

echo "create proxy"
socat TCP-LISTEN:8080,fork TCP:localhost:8188 &
echo "start comfyui"
bash /scripts/entrypoint.sh
