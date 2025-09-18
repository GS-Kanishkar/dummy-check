#!/bin/bash

QUAY_URL="blazequay.np.fssblaze.com"
QUAY_USER="quay_username_here"
QUAY_PASS="Quay@123"
IMAGE_LIST="./images.txt"
CUSTOM_ROOT="/home/podman-images/tmp"
CUSTOM_RUN="$CUSTOM_ROOT/run"

echo "Logging in to Quay..."
podman --root "$CUSTOM_ROOT" --runroot "$CUSTOM_RUN" \
       login "$QUAY_URL" --tls-verify=false -u "$QUAY_USER" -p "$QUAY_PASS" \
       || { echo "Login failed!"; exit 1; }

while IFS= read -r IMAGE; do
    [[ -z "$IMAGE" || "$IMAGE" == \#* ]] && continue
    echo "Pulling $IMAGE ..."
    podman --root "$CUSTOM_ROOT" --runroot "$CUSTOM_RUN" \
           pull --tls-verify=false "$IMAGE" || echo "Failed to pull $IMAGE"
done < "$IMAGE_LIST"

echo "Images stored under $CUSTOM_ROOT"
