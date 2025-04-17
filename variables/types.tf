# ──────────────────────────────────────────────
# Basic input variables
# ──────────────────────────────────────────────

# A string variable to set the deployment environment
variable "env" {
  type    = string
  default = "production"
}

# A number variable to set the number of replicas or instances
variable "replicas" {
  type    = number
  default = 3
}

# A boolean variable to enable or disable a feature
variable "enabled" {
  type    = bool
  default = true
}

# Example usage:
# resource "aws_autoscaling_group" "example" {
#   desired_capacity = var.replicas
#   tags = [{
#     key   = "Environment"
#     value = var.env
#   }]
#   enabled_metrics = var.enabled ? ["GroupDesiredCapacity"] : []
# }

# ──────────────────────────────────────────────
# Collection types: list, map, set
# ──────────────────────────────────────────────

# A list of availability zones (string values)
variable "azs" {
  type    = list(string)
  default = ["us-west-1a", "us-west-1b"]
}

# A map of region names to AMI IDs
variable "instance_amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-1234"
    "us-west-1" = "ami-5678"
  }
}

# A set of tags (unique string values, unordered)
variable "tags" {
  type    = set(string)
  default = ["dev", "web", "web"] # 'web' will be de-duplicated
}

# Example usage:
# resource "aws_instance" "example" {
#   ami           = var.instance_amis["us-west-1"]
#   availability_zone = var.azs[0]
#   tags = {
#     Name = "AppServer"
#   }
# }

# ──────────────────────────────────────────────
# Complex types: object and tuple
# ──────────────────────────────────────────────

# An object with specific fields and types
variable "app_config" {
  type = object({
    name    = string
    version = number
    debug   = bool
  })

  default = {
    name    = "myapp"
    version = 1
    debug   = false
  }
}

# A tuple with ordered and typed elements (string, number, bool)
variable "example_tuple" {
  type    = tuple([string, number, bool])
  default = ["abc", 5, true]
}

# Example usage:
# output "app_name" {
#   value = var.app_config.name
# }
# output "tuple_first" {
#   value = var.example_tuple[0]
# }

# ──────────────────────────────────────────────
# Special type: any (accepts any value)
# ──────────────────────────────────────────────

# A flexible variable that accepts any type of value
variable "config" {
  type = any
}

# Example usage:
# You can pass any type of structure to this variable, such as:
# config = {
#   service_port = 8080
#   secure       = true
#   labels       = ["frontend", "web"]
# }
