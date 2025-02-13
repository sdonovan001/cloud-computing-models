packer {
  required_plugins {
    googlecompute = {
      version = "1.1.3"
      source = "github.com/hashicorp/googlecompute"
    }
  }
}

variable "project_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "builder_sa" {
  type = string
}

source "googlecompute" "test-image" {
  project_id                  = var.project_id
  source_image_family         = "ubuntu-minimal-2004-lts"
  zone                        = var.zone
  image_name                  = "chart-app-ubuntu" 
  image_description           = "Created with HashiCorp Packer from Cloudbuild"
  ssh_username                = "root"
  tags                        = ["foo-bar"]
  impersonate_service_account = var.builder_sa
}

build {
  sources = ["sources.googlecompute.test-image"]

  provisioner "file" {
    source      = "src"
    destination = "/tmp"
  }

  provisioner "shell" {
    inline = [
      "sudo sh /tmp/src/setup.sh",
      "sudo rm -rf /tmp/src"
    ]
  }
}
