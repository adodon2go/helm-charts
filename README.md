# helm-charts
Helm charts for CNNS

## Adding new charts

Adding a new chart to this repository is as simple as adding it under charts/ directory

## Package a chart

Packaged charts are stored under docs/ directory which contains archived (packaged) version of charts and an index.yaml file.
The index.yaml file needs to be updated each time you add a new packaged chart

#### Example

```bash
helm package --destination docs --version v0.0.1 charts/cnns-cd-crd/
helm repo index docs --url https://adodon2go.github.io/helm-charts
```

## Useful commands

* Adding locally helm-charts repository:
```bash
helm repo add helm-charts https://adodon2go.github.io/helm-charts
```

* To search through all of the repositories configured on the system for a chart version:
```bash
helm search cnns-cd-crd
```

* Installing a Helm package in a cluster node with release name 'test-operator':
```bash
helm install cnns-cd-crd --repo https://adodon2go.github.io/helm-charts --namespace default --set org=cnns --set tag=latest --set nsr.org=cnns --set nsr.tag=latest --set nsr.serviceType=LoadBalancer --name test-operator --kubeconfig /go/src/github.com/cnns-system/kubeconfigs/central/kind-1.kubeconfig
```

* To list all Helm releases deployed in a cluster node:
```bash
helm ls --kubeconfig /go/src/github.com/cnns-system/kubeconfigs/central/kind-1.kubeconfig
```

* To delete a release with name 'test-operator' from a cluster node:
```bash
helm delete --purge test-operator --kubeconfig /go/src/github.com/cnns-system/kubeconfigs/central/kind-1.kubeconfig
```