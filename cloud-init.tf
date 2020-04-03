#################################################
# Define Cloud-init scripts to run on provisioning
#################################################


data "local_file" "cloud-config-web-left-txt" {
  filename        = "web.txt"
}

data "template_cloudinit_config" "cloud-init-left" {
  gzip            = false
  base64_encode   = false

    filename      = "init.cfg"
    content_type  = "text/cloud-config"
    content       = "${data.local_file.cloud-config-web-left-txt.content}"
  }

  }
}