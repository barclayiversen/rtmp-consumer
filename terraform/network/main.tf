resource "google_compute_address" "app" {
  name = "golang-server-address"

  project = var.project_id
  region = "us-west1"
}