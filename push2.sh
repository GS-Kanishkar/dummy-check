#!/bin/bash
#
# Tag and push all images from Quay to OCP internal registry
#

QUAY_LIST="./images.txt"                     # list of source images
OCP_PROJECT="sbi"                             # target namespace/project
OCP_REG="image-registry.openshift-image-registry.svc:5000"  # internal registry
CUSTOM_ROOT="/home/podman-images/tmp"         # optional custom storage

# Login to OpenShift and its registry
echo "Logging in to OCP registry..."
oc whoami &>/dev/null || { echo "Run 'oc login' first."; exit 1; }
podman --root "$CUSTOM_ROOT" login \
    --tls-verify=false \
    -u kubeadmin -p "$(oc whoami -t)" \
    "$OCP_REG" || { echo "Podman login to OCP failed"; exit 1; }

while IFS= read -r SRC; do
    [[ -z "$SRC" || "$SRC" == \#* ]] && continue

    # Extract just the name:tag portion after the last "/"
    NAME_TAG="${SRC##*/}"        # e.g. sbi-cms-issuance-card-extn:sbi-uat.v252
    DEST="$OCP_REG/$OCP_PROJECT/$NAME_TAG"

    echo "Tagging $SRC -> $DEST"
    podman --root "$CUSTOM_ROOT" tag "$SRC" "$DEST" || {
        echo "Tag failed for $SRC"; continue;
    }

    echo "Pushing $DEST ..."
    podman --root "$CUSTOM_ROOT" push --tls-verify=false "$DEST" || {
        echo "Push failed for $DEST"; continue;
    }
done < "$QUAY_LIST"

echo "All images pushed to $OCP_REG/$OCP_PROJECT"
