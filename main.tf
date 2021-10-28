provider "google" {
  project = "delta-trees-328005"
  region  = "us-south1"
  zone    = "us-south1-a"
}

resource "google_compute_instance" "testvm" {
  name = "vm1"
  machine_type = "e2-medium"
  zone = "us-south1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20210720"
    }
  }
  network_interface {
    network = "default"
    access_config {}
}
  service_account {
    email = "terraform@delta-trees-328005.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  metadata = {
    enable-oslogin =true
}
}
