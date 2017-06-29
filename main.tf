# Configure the AWS Provider
provider "aws" {
  profile = "${var.profile_name}"
  region  = "${var.region}"
}
