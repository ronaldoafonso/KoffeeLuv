
terraform {
    backend "s3" {
        bucket         = "ra-koffeeluv-state-file"
        key            = "dev/terraform.tfstate"
        region         = "us-east-2"
        dynamodb_table = "ra-koffeeluv-locks"
        encrypt        = true
    }
}
