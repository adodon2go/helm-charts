apiVersion: cnns.cisco.com/v1alpha1
kind: ConnectivityDomain
metadata:
  name: {{.Values.name}}
  namespace: {{.Release.Namespace}}
spec:
  fqdn: {{.Values.fqdn}}
{{- if .Values.insecure }}
  insecure: "true"
{{- else }}
  insecure: "false"
{{- end }}
  size: {{.Values.replicas}}
  ipam:
    prefixPool: {{.Values.ipam.prefixPool}}
    ipFamily: {{.Values.ipam.ipFamily}}
