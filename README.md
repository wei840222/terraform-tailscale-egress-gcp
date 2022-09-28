# terraform-tailscale-egress-gcp

A Terraform module which creates a Tailscale relay node in GCP.

## How to use ?
```bash
gcloud auth login
gcloud config set project PROJECT_ID
gcloud config set compute/zone ZONE_NAME
terraform init
```