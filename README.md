oc patch daemonset ztunnel -n ztunnel \
  --type='json' \
  -p='[{"op":"replace","path":"/spec/template/spec/containers/0/image","value":"image-registry.openshift-image-registry.svc:5000/sbi/ztunnel:1.24.6-distroless"}]'


oc rollout status daemonset/ztunnel -n ztunnel
oc get pods -n ztunnel -w
