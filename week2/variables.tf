variable "project_id" {
  description = "GCP project id (student supplies)"
  type        = string
}

variable "region" {
  #Chewbacca: Iowa. Corn. Clouds. Infrastructure.
  type    = string
  default = "us-central1"
}

variable "zone" {
  #Chewbacca: A single node awakens here.
  type    = string
  default = "us-central1-a"
}

variable "student_name" {
  #Chewbacca: Your deploy banner. Own your work.
  type    = string
  default = "Anonymous Padawan (temporarily)"
}

variable "vm_name" {
  type    = string
  default = "chewbacca-node-lab2"
}