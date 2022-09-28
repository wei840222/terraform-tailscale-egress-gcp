# terraform-tailscale-egress-gcp

A Terraform module which creates a Tailscale egress node in GCP.
https://tailscale.com/

## How to use ?
1. prepare a .auto.tfvars file contains.
```
project            = "xxxxxxx"
region             = "asia-east1"
zone               = "asia-east1-a"
tailscale_auth_key = "tskey-xxxxxxxxxxxxx"
```

2. run the commands.
```bash
gcloud auth login
terraform init
```