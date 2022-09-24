locals {
  common_tags = {
    created_by = data.terraform_user.arn
    created_at = timestamp()
  }
}