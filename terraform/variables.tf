variable "image_name" {
  description = "Name of the Nexvion Docker image"
  type        = string
  default     = "nexvion:terraform"
}

variable "container_name" {
  description = "Name of the Nexvion Docker container"
  type        = string
  default     = "nexvion-terraform"
}

variable "host_port" {
  description = "Host port for the Nexvion application"
  type        = number
  default     = 8082
}