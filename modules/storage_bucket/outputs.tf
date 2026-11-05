output "bucket_name" {
  description = "Name of the created bucket"
  value       = google_storage_bucket.project_bucket.name
}

output "bucket_location" {
  description = "Location of the created bucket"
  value       = google_storage_bucket.project_bucket.location
}

output "bucket_url" {
  description = "Google Storage URL of the bucket"
  value       = google_storage_bucket.project_bucket.url
}