variable "map_type_test" {
  type = object({ name : string, content : string })
  default = {
    name    = "Mabel",
    content = "hello
  }
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
