This directory contains old templates, used before learning about Istio. Istio replaced the functionality of these old yaml manifests/templates.

## Istio

The `old_templates/istio` dir contains the Istio yaml manifests that we used to set up the Istio service mesh. 

However, since we did not manage to configure TSL successfully on Istio, we decided to keep the working non-TLS Istio deployment in a separate branch (release/istio). This directory (`old_templates/istio`) only serves as a reference for the assignment submission.

## Prometheus

The `old_templates/prometheus` dir contains a Prometheus implementation separete from Istio, that only monitors itself.
