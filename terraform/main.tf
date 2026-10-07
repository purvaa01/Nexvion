module "nexvion" {
  source = "./modules/nexvion"

  application_name = var.application_name
  environment      = var.environment
  application_port = var.application_port
}