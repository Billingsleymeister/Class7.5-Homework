variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "zone" {
  description = "GCP zone for the compute instance"
  type        = string
}

variable "student_name" {
  description = "Name passed to the VM metadata"
  type        = string
}

variable "vm_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "prefix" {
  description = "Base name used for VM and security group naming"
  type        = string
  default     = "mephisto-web"
}
