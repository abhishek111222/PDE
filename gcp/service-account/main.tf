resource "google_service_account" "service-account" {
  account_id = "local-to-gcp"
  display_name = "local machine to GCP"
}


resource "google_project_iam_member" "name" {
  project = var.project_id
  for_each = toset([
    "roles/bigquery.admin",
    "roles/bigquery.connectionAdmin"
  ])
  member = "serviceAccount:${google_service_account.service-account.email}"
  role = each.key
}