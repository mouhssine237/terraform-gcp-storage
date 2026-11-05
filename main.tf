module "storage_bucket" {
  source = "./modules/storage_bucket"

  bucket_name     = var.bucket_name
  bucket_location = var.bucket_location
}

moved {
  from = google_storage_bucket.project_bucket
  to   = module.storage_bucket.google_storage_bucket.project_bucket
}