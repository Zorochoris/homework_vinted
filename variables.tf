variable "project_id" {
  description = "The ID of the Google Cloud project"
  default     = "central-insight-387811"
}

variable "region" {
  description = "The region to create resources in"
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to create resources in"
  default     = "us-central1-a"
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet"
  default     = "10.0.0.0/24"
}

variable "instance_name" {
  description = "The name of the Compute Engine instance"
  default     = "atlantis-instance"
}