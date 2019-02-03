resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

provisioner "file" {
    source      = "./../files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "./../files/deploy.sh"
  }





  network_interface {
    network = "default"

    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

data "template_file" "puma" {
  template = "${file("./../files/puma.service")}"

  vars = {
    DATABASE_URL = "${var.db_internal_ip}"
  }
}
