# Derived naming based on prefix variable.
# Add a network tag for the VM and a firewall name for 
# the security group, both derived from the prefix variable for consistency.

locals {
  network_tag   = "${var.prefix}-vm"
  firewall_name = "${var.prefix}-sg"
}

# Set the security rules to allow HTTP inbound traffic to the VM.
resource "google_compute_firewall" "mephisto_allow_http" {
  name    = local.firewall_name
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  # Apply rule only to VMs with the correct tag.
  target_tags = [local.network_tag]
}

# Create a Compute Engine instance for the Mephisto deployment.

resource "google_compute_instance" "mephisto_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {} # External IP
  }

  # Set metadata to pass the student name to the startup script for personalized setup.
  metadata = {
    student_name = var.student_name
  }

  # Use external startup script file
  metadata_startup_script = file("${path.module}/startup.sh")

  # VM tag (derived from prefix, e.g., mephisto-web-vm)
  tags = [local.network_tag]
}

# Provide the external IP address of the VM as an output variable.
output "vm_external_ip" {
  value = google_compute_instance.mephisto_vm.network_interface[0].access_config[0].nat_ip
}

# Provide the URL to access the VM as an output variable.
output "vm_url" {
  value = "http://${google_compute_instance.mephisto_vm.network_interface[0].access_config[0].nat_ip}"
}
