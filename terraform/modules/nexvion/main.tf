resource "local_file" "nexvion_config" {
  filename = "${path.root}/generated/nexvion-${var.environment}.conf"

  content = <<-EOT
    APPLICATION_NAME=${var.application_name}
    ENVIRONMENT=${var.environment}
    APPLICATION_PORT=${var.application_port}
  EOT
}