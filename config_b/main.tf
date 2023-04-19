
variable "content" {
    default = "moo! from the config_b sub directory"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_b.txt"
}