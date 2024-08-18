resource "google_service_account" "composer_sa" {
  account_id   = "composer-service-account"
  display_name = "Composer Service Account"
}


resource "google_project_iam_member" "composer-sa-roles" {
    project = var.project_id
    for_each = toset([
        "roles/composer.user",
        "roles/storage.admin",
        "roles/dataproc.editor",
    ])
    member = "serviceAccount:${google_service_account.composer_sa.email}"
    role = each.key
}


resource "google_compute_network" "vpc_network" {
  name = "composer-vpc-network"
  description = "The VPC we will use for composer and dataproc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet" {
  name = "composer-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region = var.region
  network = google_compute_network.vpc_network.id
}
