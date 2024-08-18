
resource "google_service_account" "composer_sa" {
    //Create Service Account
  account_id   = "composer-service-account"
  display_name = "Composer Service Account"
}


resource "google_project_iam_member" "composer-sa-roles" {
    //Create roles for the SA
    project = var.project_id
    for_each = toset([
        "roles/composer.user",
        "roles/storage.admin",
        "roles/dataproc.editor",
        "roles/composer.worker",
        "roles/composer.admin",
        "roles/composer.worker",
        "roles/dataproc.worker",
        //"roles/dataproc.admin",
    ])
    member = "serviceAccount:${google_service_account.composer_sa.email}"
    role = each.key
}

resource "google_project_iam_member" "new-sa" {
    //Create roles for the SA
    project = var.project_id
    member = "serviceAccount:service-89717399971@cloudcomposer-accounts.iam.gserviceaccount.com"
    role = "roles/composer.ServiceAgentV2Ext"
}

resource "google_compute_network" "vpc_network" {
    //Create VPC network
  name = "composer-vpc-network"
  description = "The VPC we will use for composer and dataproc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet" {
    //subnetwork for the above VPC
  name = "composer-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region = var.region
  network = google_compute_network.vpc_network.id
}



resource "google_composer_environment" "composer_env" {
  //Create composer environment
  name = "dataproc-composer-env"
  project = var.project_id
  region = var.region


  config {
    
    //"composer-2.9.1-airflow-2.9.1"    --> This version took 22 CPUs. If we decrease the version of both composer and airflow can we get more CPU to use later. 
    software_config {
      image_version = "composer-2.4.1-airflow-2.5.3"   //This version is also using the same number of CPU
    }

    node_config {
      service_account   =     google_service_account.composer_sa.email
      network           =     google_compute_network.vpc_network.name
      subnetwork        =     google_compute_subnetwork.subnet.name
    }
  }
}


//When trying to create a dataproc cluster after the composer is created, it has no CPU left. 

/*
resource "google_dataproc_cluster" "dataproc_cluster" {
    //Number of workers should be minimum of 2
  name = "dataproc-cluster"
  project = var.project_id
  region = var.region
  labels = {
    "for" = "practice",
    "try" = 1
  }


  cluster_config {
    master_config {
      num_instances = 1
      machine_type = "n1-standard-1"
    }

    worker_config {
      num_instances = 2
      machine_type = "n1-standard-1"
    }

    software_config {
      image_version = "1.5-debian10"
    }

    gce_cluster_config {
      service_account = google_service_account.composer_sa.email
      subnetwork = google_compute_subnetwork.subnet.id
      tags = ["dataproc", "composer"]
    }
  }
}
*/