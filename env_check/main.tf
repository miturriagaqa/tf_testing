variable "place_holder" {
    default = "you need to have this"
}

resource "null_resource" "env_check" {
  provisioner "local-exec" {
    command = "env > /tmp/env_check.txt"
  }
}