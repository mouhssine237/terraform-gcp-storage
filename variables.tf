variable "project_id" {
  description = "Identifiant du projet Terraform local"
  type        = string
  default     = "terraform-local-project"
}

variable "bucket_name" {
  description = "Nom du bucket de stockage"
  type        = string
  default     = "terraform-demo-bucket-2026"
}

variable "bucket_location" {
  description = "Localisation du bucket"
  type        = string
  default     = "US-CENTRAL1"
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
  default     = "development"
}