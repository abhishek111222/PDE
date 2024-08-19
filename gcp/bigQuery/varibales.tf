variable "project_id" {
  type = string
  description = "The Project ID"
}

variable "region" {
  type = string
  description = "The region where the bigQuery dataset will be created."
}


variable "tables" {
  description = <<EOF
  The table to be created in the dataset.
  The one created from the terraform and the one created from the console will be checked for the labels.
  EOF
  type = list(string)
}



variable "tables_with_labels" {
  description = <<EOF
  These tables will be created with the labels parameters.
  EOF
  type = list(string)
}