resource "google_compute_instance" "default" {
  name         = "golang-server-tf"
  machine_type = "g1-small"
  zone         = "us-west1-b"
  project = var.project_id

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "projects/${var.project_id}/global/images/family/golang-server"
      type = "pd-standard"
    }

  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = data.terraform_remote_state.foundation.outputs.go_ip
      
    }
  }

  metadata = {}

  metadata_startup_script = "systemctl enable nginx;systemctl start nginx"



  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}



