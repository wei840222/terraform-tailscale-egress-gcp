resource "google_compute_address" "tailscale" {
  name = "tailscale"
}

resource "google_compute_instance" "tailscale" {
  name                    = "tailscale"
  machine_type            = var.instance_type
  metadata_startup_script = sensitive(data.template_file.startup_script.rendered)
  desired_status          = "RUNNING"
  tags                    = var.instance_network_tags

  boot_disk {
    initialize_params {
      type  = "pd-standard"
      size  = 20
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tailscale.self_link
    access_config {
      nat_ip = google_compute_address.tailscale.address
    }
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  scheduling {
    provisioning_model = "SPOT"
    preemptible        = true
    automatic_restart  = false
  }

}

data "template_file" "startup_script" {
  template = file("${path.module}/startup_script.sh")

  vars = {
    authkey  = var.tailscale_auth_key
    hostname = var.hostname
  }
}
