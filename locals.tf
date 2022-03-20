locals {
  cloud_user_pw = var.cloud_user_pw ? var.cloud_user_pw : random_password.this_cloud_user.result
  root_pw = var.root_pw ? var.root_pw : random_password.this_root_user.result
}