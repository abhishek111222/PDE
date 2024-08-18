output "composer_sa_email" {
  value = google_service_account.composer_sa.email
}


output "vpc_network" {
  value = google_compute_network.vpc_network.self_link
}


output "subnet" {
  value = google_compute_subnetwork.subnet.self_link
}


output "composer_name" {
  value = google_composer_environment.composer_env.name
}