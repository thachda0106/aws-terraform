variable "DEFAULT_TAG" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "my-app"
    Owner       = "team-a"
    Terraform   = "true"
  }
}
