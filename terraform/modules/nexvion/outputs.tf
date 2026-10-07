output "application_name" {
  description = "Application name"
  value       = var.application_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "configuration_file" {
  description = "Generated configuration file"
  value       = local_file.nexvion_config.filename
}