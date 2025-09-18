jetstream:
  enabled: true
  image:
    repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats
    tag: 0.15.0
    pullPolicy: IfNotPresent

accountserver:
  image: "image-registry.openshift-image-registry.svc:5000/nats-is/nats-account-server:1.0.0"
  pullPolicy: IfNotPresent

image:
  repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats-kafka
  tag: 1.4.2
  pullPolicy: IfNotPresent

image:
  registry: image-registry.openshift-image-registry.svc:5000
  repository: nats-is/nats-operator
  tag: 0.8.3

metrics:
   enabled: false
   registry: image-registry.openshift-image-registry.svc:5000
   repository: nats-is/prometheus-nats-exporter
   tag: "0.6.2"
   pullPolicy: "IfNotPresent"

configReload:
   enabled: false
   registry: image-registry.openshift-image-registry.svc:5000
   repository: nats-is/nats-server-config-reloader
   tag: "0.2.2-v1alpha2"
   pullPolicy: "IfNotPresent"

container:
  image:
    repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats
    tag: 2.10.17-alpine
    pullPolicy:
    registry: image-registry.openshift-image-registry.svc:5000

reloader:
  enabled: true
  image:
    repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats-server-config-reloader
    tag: 0.14.3
    pullPolicy:
    registry: image-registry.openshift-image-registry.svc:5000

promExporter:
  enabled: false
  image:
    repository: image-registry.openshift-image-registry.svc:5000/nats-is/prometheus-nats-exporter
    tag: 0.15.0
    pullPolicy:
    registry: image-registry.openshift-image-registry.svc:5000

natsBox:
  enabled: true

  ############################################################
  # NATS contexts
  ############################################################
  contexts:
    default:
      creds:
        contents:
        secretName:
        dir:
        key: nats.creds
      nkey:
        contents:
        secretName:
        dir:
        key: nats.nk
      tls:
        secretName:
        dir:
        cert: tls.crt
        key: tls.key
      merge: {}
      patch: []

  defaultContextName: default

  ############################################################
  # deployment -> pod template -> nats-box container
  ############################################################
  container:
    image:
      repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats-box
      tag: 0.14.3
      pullPolicy:
      registry: image-registry.openshift-image-registry.svc:5000

stan:
  image: image-registry.openshift-image-registry.svc:5000/nats-is/nats-streaming:0.23.2
  pullPolicy: IfNotPresent
  replicas: 1

exporter:
  enabled: true
  image: image-registry.openshift-image-registry.svc:5000/nats-is/prometheus-nats-exporter:latest
  pullPolicy: IfNotPresent
  securityContext: {}
  resources: {}

bootconfig:
  image: image-registry.openshift-image-registry.svc:5000/nats-is/nats-boot-config:0.5.4
  pullPolicy: IfNotPresent

reloader:
  enabled: false
  image: image-registry.openshift-image-registry.svc:5000/nats-is/nats-server-config-reloader:0.6.2
  pullPolicy: IfNotPresent
  securityContext: {}

image:
  repository: image-registry.openshift-image-registry.svc:5000/nats-is/nats-surveyor
  tag: 0.5.4
  pullPolicy: IfNotPresent

############################################################
# ingress
############################################################
ingress:
  enabled: true
  ingressClassName: cilium
  hosts: []
  path: /
  pathType: Exact
  className:
  tlsSecretName:
