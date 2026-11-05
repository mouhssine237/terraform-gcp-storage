output "bucket_name" {
  description = "Nom du bucket créé"
  value       = module.storage_bucket.bucket_name
}

output "bucket_location" {
  description = "Localisation du bucket"
  value       = module.storage_bucket.bucket_location
}

output "bucket_url" {
  description = "URL Google Storage du bucket"
  value       = module.storage_bucket.bucket_url
}