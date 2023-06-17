variable "master" {
  type = string
}

variable "username" {
  type = string
}

variable "private_key" {
  type = string
}

resource "null_resource" "raspi_wifi" {
  connection {
    type = "ssh"
    user = var.username
    host = var.master
    private_key = var.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh -c 'echo \"I am `whoami`\"'"
    ]
  }
}
