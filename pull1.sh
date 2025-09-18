#!/bin/bash
#
# Pull all images listed in images.txt from Quay
#

QUAY_URL="blazequay.np.fssblaze.com"
QUAY_USER="quay_username_here"
QUAY_PASS="Quay@123"
IMAGE_LIST="./images.txt"   # change if you keep the file elsewhere

# Login once
echo "Logging in to Quay registry..."
podman login "${QUAY_URL}" --tls-verify=false -u "${QUAY_USER}" -p "${QUAY_PASS}" || {
    echo "Login failed!"
    exit 1
}

# Read each image and pull it
while IFS= read -r IMAGE; do
    # skip blank lines or comments
    [[ -z "$IMAGE" || "$IMAGE" == \#* ]] && continue

    echo "Pulling $IMAGE ..."
    podman pull --tls-verify=false "$IMAGE" || {
        echo "Failed to pull $IMAGE"
        # decide whether to exit or continue
        # exit 1
    }
done < "$IMAGE_LIST"

echo "All done!"
