resource "google_bigquery_dataset" "biguery_dataset" {
  project = var.project_id
  dataset_id = "dataset_1"
  location = var.region
  description = "The first test dataset"
  delete_contents_on_destroy = true



  #The labels got created which we can see. 
  labels = {
    "env" = "test"
    "name" = "abhi"
    "try" = 1
  } 
}



//This is to check if the labels will get inherited from the dataset.
//---> The output is an empty labels for both the tables. 
//This worked without schema.
resource "google_bigquery_table" "table" {
  for_each = toset(var.tables)
  project = var.project_id
  dataset_id = google_bigquery_dataset.biguery_dataset.dataset_id
  table_id = each.value
  deletion_protection = false
}


//These got created with labels. 
//But no schema was required for this.
resource "google_bigquery_table" "tables_w_labels" {
  for_each = toset(var.tables_with_labels)
  project = var.project_id
  dataset_id = google_bigquery_dataset.biguery_dataset.dataset_id
  table_id = each.value
  deletion_protection = false
  labels = { 
    "label" = "from-tf-to-check-the-added-label-from-consple"    //If you will change the labels here, those will be reflected in the console. 
  }
}


//After this creted a table    ---> table-with-console which does not have the labels. 
//This tells us that the labels needs to be explicitly mentioned in both the resources to get reflected. 





//Now change the table labels and see diff in tf file? In table-2-tf, added a label. Now see the working of terraform. 
//In the terraform state file, there are no labels.
resource "google_bigquery_table" "check_run" {
  project = var.project_id
  dataset_id = google_bigquery_dataset.biguery_dataset.dataset_id
  table_id = "check-run-1"
  deletion_protection = false
  labels = {
    "label" = "label-1"
  }
}

//The above line ran fine and there was diff in the tf state file. 
//labels --> This parameter is used to define the labels that Terraform should manage and apply to the bigQuery dataset. 





//if we use the labels parameters within the tf, the only labels which are mentioned in the tf file will work. No other labels managed from any
//external souce will not get reflected in the GCP



//check-run-2 to check the working of the effective_label. 
resource "google_bigquery_table" "check_run_2" {
  project = var.project_id
  dataset_id = google_bigquery_dataset.biguery_dataset.dataset_id
  table_id = "check-run-2"
  deletion_protection = false
  labels = {
    "label" = "check-run-2"
  }
}



//Now, I have changed the label from the console and will check for the effective_label parameters. 
//We are looking at the plan. 
//The effective label is also the same. now, lets see after the apply. 
//The tf state file as effective_labels which shows the labels from the console. 
//The effective_labels is present in the tf state file. 



//check-run-3 to check the working of the effective_label. 
resource "google_bigquery_table" "check_run_3" {
  project = var.project_id
  dataset_id = google_bigquery_dataset.biguery_dataset.dataset_id
  table_id = "check-run-3"
  deletion_protection = false
  labels = {
    "label" = "check-run-3"
  }
}
