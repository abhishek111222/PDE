terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.41.0"
    }
  }
}

provider "google" {
    project = "reliable-realm-432907-g1"
    region = "europe-west2"
    credentials = "SA.json"
}