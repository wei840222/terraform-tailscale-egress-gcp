terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.38.0"
    }
  }
  backend "s3" {
    endpoint                    = "https://api-minio.weii.dev"
    region                      = "main"
    bucket                      = "terraform-state"
    key                         = "terraform-tailscale-egress-gcp.tfstate"
    force_path_style            = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
