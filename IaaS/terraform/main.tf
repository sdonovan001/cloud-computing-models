provider "google" {
  project    = "sdonovan-demo"
  region     = "us-central1"
}

resource "google_compute_instance" "default" {
  provider     = google
  name         = "chart-app"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "chart-app-ubuntu"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
