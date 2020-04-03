////////////////
//Define Zones
////////////////

variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-south"
}

variable "zone1" {
  default = "us-south-1"
  description = "Define the 1st zone of the region"
}


variable "vpc-name" {
  default = "basic-vpc-demo"
  description = "Name of your VPC"
}


////////////////
// Define CIDR
////////////////


variable "vpc-address-prefix" {
  default = "192.168.0.0/20"
}

variable "az1-prefix" {
  default = "192.168.0.0/21"
  description = "CIDR block to be used for zone 1"




  //////////////////
// Define SSH Key
//////////////////

variable "ssh-key-name" {
  default = "default"
  description = "Name of existing VPC SSH Key"
}