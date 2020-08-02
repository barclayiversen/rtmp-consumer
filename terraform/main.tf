resource "google_compute_instance" "default" {
  name         = "golang-server-tf"
  machine_type = "g1-small"
  zone         = "us-west1-b"
  project = "mixfreely"

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "projects/mixfreely/global/images/family/golang-server"
      type = "pd-standard"
    }

  }

  network_interface {
    network = "default"

    access_config {

    }
  }

  metadata = {}


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}