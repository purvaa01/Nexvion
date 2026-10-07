output "application_name" {
  description = "Nexvion application name"
  value       = module.nexvion.application_name
}

output "environment" {
  description = "Deployment environment"
  value       = module.nexvion.environment
}

output "configuration_file" {
  description = "Generated Terraform configuration file"
  value       = module.nexvion.configuration_file
}