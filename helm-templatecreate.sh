CHART_PATH="./k8s/charts/cms/sbi"
ENV_VALUES="./k8s/charts/cms/sbi/values-environment/sbiuat.yaml"
OUTPUT_DIR="../sbi-manifests"
 
for values_file in ${CHART_PATH}/values-microservice/*.yaml; do
    svc_name=$(basename "$values_file" .yaml)
 
    echo "Generating manifests for $svc_name..."
 
    helm template "$svc_name" "$CHART_PATH" \
            -f "$ENV_VALUES" \
                -f "$values_file" \
                --output-dir "$OUTPUT_DIR/$svc_name"
done

#helm template cbi-cms-issuance-ui-app.yaml cbi/ -f cbi/values-environment/uat.yaml --output-dir manifests/