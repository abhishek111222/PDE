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

