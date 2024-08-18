resource "google_storage_bucket" "check-bucket" {
  name = "unexpected-name-test-bucket" //This is a test bucket to see if the main.tf is working as expected. 
  location = "EU"              
  force_destroy = true                 //Terraform will destroy the objects 
}


