apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-dns-publisher
spec:
  selector:
    matchLabels:
      run: app-dns-publisher
  replicas: 1
  template:
    metadata:
      labels:
        run: app-dns-publisher
    spec:
      containers:
        - name: app-dns-publisher
          image: {{ .Values.registry }}/{{ .Values.org }}/app-dns-publisher-controller:{{ .Values.tag }}
          imagePullPolicy: {{ .Values.pullPolicy }}
          command: [ "/app/bin/app-dns-publisher-controller" ]
          args: [ "-a", "$(NAMESPACE)" ]
          env:
          - name: POD_UID
            valueFrom:
              fieldRef:
                fieldPath: metadata.uid
          - name: NAMESPACE
            value: {{ .Values.watchNamespace }}
