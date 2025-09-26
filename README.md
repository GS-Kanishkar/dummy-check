apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: allow-impersonation
  namespace: sbi
rules:
- apiGroups: [""]
  resources: ["serviceaccounts"]
  verbs: ["impersonate"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: ztunnel-impersonation
  namespace: sbi
subjects:
- kind: ServiceAccount
  name: ztunnel
  namespace: ztunnel
roleRef:
  kind: Role
  name: allow-impersonation
  apiGroup: rbac.authorization.k8s.io