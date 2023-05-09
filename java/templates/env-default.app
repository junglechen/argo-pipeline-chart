
{{- define "env-default.app" -}}


- name: POD_NAMESPACE
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: metadata.namespace
- name: POD_IP
  valueFrom:
    fieldRef:
      apiVersion: v1
      eldPath: status.podIP
- name: CX_DEPLOY_ENV
  value: {{.Values.branch.env}}
- name: CX_POD_PVT
  value: {{ .Values.branch.pvt}}
- name: CX_POD_APP
  value: {{.Values.branch.osApp}}
- name: CX_POD_COLOR
  value: {{.Values.branch.colorString}}
- name: CX_POD_CLUSTER
  value: {{.Values.branch.cluster}}
- name: CX_POD_ENV
  value: {{.Values.branch.env}}
- name: CX_DEBUG
  value: {{.Values.dc.containers.env.default.CX_DEBUG}}
- name: CX_USE_APP_CERTS
  value: 'true'
- name: CX_USE_APPDYNAMICS
  value: 'false'
- name: CX_USE_FILEBEAT
  value: 'false'
- name: CX_USE_HAWKULAR_FORWARDER
  value: 'false'
- name: CX_USE_APP_LOGFILE
  value: 'false'
- name: CX_LOG_SPLIT_BYTE
  value: '16000'
- name: CX_RESOURCE_POD_MEMORY_ALGO
  value: OPTIMIZED
- name: CX_RESOURCE_OS_RESERVE_MEMORY
  value: '128'
- name: CX_RESOURCE_JAVA_MEMORY_METASPACE_MB
  value: '128'
- name: CX_RESOURCE_POD_MEMORY_LIMIT_MB
  value: '768'
- name: CX_RESOURCE_POD_MEMORY_REQUEST_MB
  value: '768'
- name: CX_LOGSTASH_HOSTS
  valueFrom:
    configMapKeyRef:
      name: cx-logstash
      key: host
- name: CX_APPDYNAMICS_CONTROLLER_HOST_NAME
  valueFrom:
    configMapKeyRef:
      name: cx-appdynamics
      key: host-name
- name: CX_APPDYNAMICS_ACCOUNT_NAME
  valueFrom:
    configMapKeyRef:
      name: cx-appdynamics
      key: account-name
- name: CX_APPDYNAMICS_ACCOUNT_ACCESS_KEY
  valueFrom:
    configMapKeyRef:
      name: cx-appdynamics
      key: access-key
- name: CX_SEEKER_SERVER_URL
  value: {{if .Values.branch.isEteCluster}}https://iast-internal.ct1.cathaypacific.com:443 {{ else}}https://iast-internal.cp1.cathaypacific.com:443{{ end}}
- name: CX_SEEKER_ACCESS_TOKEN
  valueFrom:
    secretKeyRef:
      name: cx-seeker-{{ .Values.branch.pvt}}
      ey: agent-token
- name: CX_USE_SEEKER
  value: 'true'
- name: CX_CONJUR_HOST_NAME
  valueFrom:
    configMapKeyRef:
      name: cx-conjur
      key: host-name
- name: CX_CONJUR_USER_NAME
  valueFrom:
    secretKeyRef:
      name: cx-conjur-{{.Values.branch.pvt}}
      key: user-name
- name: CX_CONJUR_API_KEY
  valueFrom:
    configMapKeyRef:
      name: cx-conjur-{{.Values.branch.pvt}}
      key: api-key  
{{- end -}}