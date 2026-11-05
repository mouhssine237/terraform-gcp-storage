output "bucket_name" {
  description = "Nom du bucket créé"
  value       = google_storage_bucket.project_bucket.name
}

output "bucket_location" {
  description = "Région du bucket"
  value       = google_storage_bucket.project_bucket.location
}

output "bucket_url" {
  description = "URL Google Storage du bucket"
  value       = google_storage_bucket.project_bucket.url
}