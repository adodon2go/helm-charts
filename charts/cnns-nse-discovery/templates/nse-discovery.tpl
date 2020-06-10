apiVersion: apps/v1
kind: Deployment
metadata:
  name: nse-discovery
  namespace: nsm-system
spec:
  replicas: 1
  selector:
    matchLabels:
      nse-discovery/app: {{.Values.label}}
  template:
    metadata:
      labels:
        nse-discovery/app: {{.Values.label}}
    spec:
      serviceAccountName: nse-discovery-sa
      containers:
      - name: nse-discovery
        image: {{ .Values.registry }}/{{ .Values.org }}/nse-discovery-operator:{{ .Values.tag }}
        imagePullPolicy: {{ .Values.pullPolicy }}
        env:
        - name: POD_UID
          valueFrom:
              fieldRef:
                fieldPath: metadata.uid
        - name: CLUSTER_NAME
          value: {{.Values.clusterName}}
        - name: NSE_NAMESPACE
          value: {{.Values.nseNamespace}}
        - name: NSR_ADDRESS
          value: {{.Values.nsrAddress}}
        - name: INSECURE
{{- if .Values.insecure }}
          value: "true"
{{- else }}
          value: "false"
{{- end }}


