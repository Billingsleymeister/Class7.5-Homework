# Chewbacca: A firewall rule so port 80 can sing to the world.
resource "google_compute_firewall" "chewbacca_allow_http" {
  name    = "chewbacca-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["chewbacca-web"]
}

# Chewbacca: The compute instance—now using the external script method.
resource "google_compute_instance" "chewbacca_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  # This block tells GCP what OS to install
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  # This block connects the VM to the internet
  network_interface {
    network = "default"
    access_config {
      # Leaving this empty creates an External IP
    }
  }

  # THE MAGIC LINE: Loads the raw text from your startup.sh file
  metadata_startup_script = file("${path.module}/startup.sh")

  # This tag matches the Firewall rule above
  tags = ["chewbacca-web"]
}

# Output the IP so you can run the gate script
output "vm_external_ip" {
  value = google_compute_instance.chewbacca_vm.network_interface[0].access_config[0].nat_ip
}