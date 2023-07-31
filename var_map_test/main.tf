variable "map_type_test" {
  type = object({ name : string, content : string })
  default = {
    name    = "Mabel",
    content = "This is a test\n"
  }
}

variable "list_type_test" {
  type    = list(any)
  default = ["red", "yellow", "green"]
}

variable "another_list_type_test" {
  type    = list(any)
  default = ["10.99.1.0/24", "10.99.2.0/24"]
}

variable "bool_type_test" {
  type    = bool
  default = false
}

variable "null_type_test" {
  default = "default if not supplied or null"
}

variable "resource_handler" {
  type    = string
  default = ""
}

variable "static" {
  type    = number
  default = 0
}

resource "local_file" "foo" {
  filename = "/tmp/${var.map_type_test["name"]}"
  content  = <<-EOT
    resource_handler = ${var.resource_handler}
    something static = ${var.static}
    ${var.map_type_test["content"]}
    %{for color in var.list_type_test~}
list item = ${color}
    %{endfor~}
Bool vaule = ${var.bool_type_test}
  EOT
}

output "my_map" {
  value = var.map_type_test
}

output "my_list" {
  value = var.list_type_test
}

output "my_list_another" {
  value = var.another_list_type_test
}

output "my_bool" {
  value = var.bool_type_test
}

output "my_rh" {
  value = var.resource_handler
}

output "my_static_number" {
  value = var.static
}

output "my_nullable" {
  value = var.null_type_test != "null" ? var.null_type_test : "default because null"
}
