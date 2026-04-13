# Configure the Google Cloud provider with project, region, and zone variables.

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
