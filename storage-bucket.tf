provider "google" {
  version = "1.20.0"
  project = "${var.project}"
  region  = "${var.region}"
  zone = "${var.zone}"
}

resource "google_storage_bucket" "state_bucket" {
  name = "bucket-ugaidmitry"


  versioning {
    enabled = true
  }

  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket_acl" "state_storage_bucket_acl" {
bucket         = "${google_storage_bucket.state_bucket.name}"
predefined_acl = "publicreadwrite"