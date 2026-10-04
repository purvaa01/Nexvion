output "container_id" {
  description = "ID of the Nexvion Docker container"
  value       = docker_container.nexvion.id
}

output "application_url" {
  description = "URL of the Nexvion application"
  value       = "http://localhost:${var.host_port}"
}