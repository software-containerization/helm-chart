# helm-chart

Contains the Helm chart for our web application

## Enable Istio
```bash
$ microk8s enable istio
```

## Run the app
To allow the Istio service mesh to work a namespace with the istio-inject label has to be made:


```bash
$ kubectl create namespace todo-app
$ kubectl label namespace todo-app istio-injection=enabled
```

Install the helm-chart:

```bash
$ helm install todo-app . -n todo-app
```

