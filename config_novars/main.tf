resource "local_file" "config_file" {
    content     = "no vars!!"
    filename = "/tmp/config_novars.txt"
}