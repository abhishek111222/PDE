variable "project_id" {
  type = string
  default = "reliable-realm-432907-g1"
  description = "The project ID to deploy resources."
}


variable "region" {
  type = string
  description = "The region to deploy resources."
  default = "europe-west2"
}