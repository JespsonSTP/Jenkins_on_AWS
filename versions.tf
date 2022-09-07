#terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "jespurlqrappinfra"
    key    = "urlqrapp/production/us-east-1/jespurlqrappinfra/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "URLQRterraform-state-lock"
    encrypt        = true
  }
}
