# helm-chart

Contains the Helm chart for our web application

## Installation

### Build images and push to microk8s registry

```bash
$ ./build_images.sh 1 # The argument indicates the tag of the images 1 = image:v1
```

### Enable Istio and Metallb

```bash
$ microk8s enable istio metallb
```

When metallb asks for an IP range, input `10.50.100.5-10.50.100.25`:

```bash
Enabling MetalLB
Enter each IP address range delimited by comma (e.g. '10.64.140.43-10.64.140.49,192.168.0.105-192.168.0.111'): 10.50.100.5-10.50.100.25
```

### (Optional) Edit /etc/hosts

In order to curl to the **todo-app.com** url from your cluster, e.g. for development purposes, edit your /etc/hosts file in your cluster, so that your gateway IP is associated with **todo-app.com**.

```bash
# /etc/hosts
YOUR_GATEWAY_IP todo-app.com
```

You can find `YOUR_GATEWAY_EXTERNAL_IP` by typing 

```bash
kubectl get svc istio-ingressgateway -n istio-system
```

It is then found under the column `EXTERNAL_IP`.

### Create namespace

To allow the Istio service mesh to work, a namespace with the `istio-injection` label has to be made:

```bash
$ kubectl create namespace todo
$ kubectl label namespace todo istio-injection=enabled
```

### Install the Helm chart

Install the Helm chart with the namespace created in the previous step.

```bash
$ microk8s helm3 install todo-app . -n todo
```
