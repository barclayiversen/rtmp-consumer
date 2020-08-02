resource "google_compute_address" "static" {
  name = "golang-server-addresss"

  project = var.project_id
  region = "us-west1"
}