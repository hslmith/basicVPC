//Single Zone, Single VPC, Variable Server Count

////////////////
//SSH Key
////////////////


data "ibm_is_ssh_key" "sshkey1" {
  name = "${var.ssh-key-name}"
}

