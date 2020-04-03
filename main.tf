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
  name = "${var.vpc-name}"
  address_prefix_management = "manual"
  resource_group = "${data.ibm_resource_group.resource.id}"
}

////////////////
//Network Config
///////////////

// Public Gateway()s


resource "ibm_is_public_gateway" "pubgw-zone1" {
  name = "${var.vpc-name}-${var.zone1}-pubgw"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  zone = "${var.zone1}"
}

//--- address prexix for VPC

resource "ibm_is_vpc_address_prefix" "prefix_z1" {
  name = "vpc-zone1-cidr"
  zone = "${var.zone1}"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  cidr = "${var.az1-prefix}"
}

//--- subnets

resource "ibm_is_subnet" "websubnet1" {
  name            = "web-subnet-zone1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  network_acl     = "${ibm_is_network_acl.isBasicACL.id}"
  public_gateway  = "${ibm_is_public_gateway.pubgw-zone1.id}"
  ipv4_cidr_block = "${var.web_subnet_zone1}"
  depends_on      = ["ibm_is_vpc_address_prefix.prefix_z1"]

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}