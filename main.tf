//Single Zone, Single VPC, Variable Server Count

////////////////
//SSH Key
////////////////


data "ibm_is_ssh_key" "sshkey1" {
  name = "${var.ssh-key-name}"
}

////////////////
//Create VPC
///////////////

data "ibm_resource_group" "resource" {
  name = "${var.resource_group}"
}

resource "ibm_is_vpc" "vpc1" {
  name = "${var.vpc_name}"
  address_prefix_management = "manual"
  resource_group = "${data.ibm_resource_group.resource.id}"
}

////////////////
//Create VPC CIDR and Zone Prefixes
///////////////