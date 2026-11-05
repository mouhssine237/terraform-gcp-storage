
provider "google" {
  project = var.project_id
  region  = "us-central1"

  # Endpoint de notre émulateur local
  storage_custom_endpoint = "http://localhost:4443/storage/v1/"

  # Jeton fictif : uniquement pour l'émulateur local
  access_token = "fake-local-token"
}
