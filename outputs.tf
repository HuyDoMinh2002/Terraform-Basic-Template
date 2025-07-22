output "instance_public_ip" {
  value = "http://${module.compute.instance_public_ip}"
}