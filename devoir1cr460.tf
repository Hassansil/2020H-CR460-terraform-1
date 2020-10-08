provider "google" {
  project = "cr460-a2020-291900"
  credentials = "account.json"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "vm_instance1" {
  name         = "canard"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "prod-dmz"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance2" {
  name         = "mouton"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network2" {
  name                    = "prod-interne"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance3" {
  name         = "cheval"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network3" {
  name                    = "prod-traitement"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance4" {
  name         = "fermier"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
