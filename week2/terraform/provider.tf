provider "google" {
  #Chewbacca: The Force needs coordinates.
  project = var.project_id
  region  = var.region
  zone    = var.zone
  credentials = file("credentials.json")
}
