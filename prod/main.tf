
module "vpc" {
    source = "../modules/vpc"

    vpc = {
        cidr_block = "172.16.0.0/16"
        tags = {
            name = "koffeeluv-main-prod"
            environment = "production"
        }
    }

    subnets = {
        publicA = {
            cidr_block = "172.16.1.0/24"
            availability_zone = "us-east-1a"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeluv-publicA-prod"
                environment = "production"
            }
        }
        publicB = {
            cidr_block = "172.16.2.0/24"
            availability_zone = "us-east-1b"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeeluv-publicB-prod"
                environment = "production"
            }
        }
        publicC = {
            cidr_block = "172.16.3.0/24"
            availability_zone = "us-east-1c"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeeluv-publicC-prod"
                environment = "production"
            }
        }
        AppA = {
            cidr_block = "172.16.4.0/24"
            availability_zone = "us-east-1a"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppA-prod"
                environment = "production"
            }
        }
        AppB = {
            cidr_block = "172.16.5.0/24"
            availability_zone = "us-east-1b"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppB-prod"
                environment = "production"
            }
        }
        AppC = {
            cidr_block = "172.16.6.0/24"
            availability_zone = "us-east-1c"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppC-prod"
                environment = "production"
            }
        }
        DbA = {
            cidr_block = "172.16.7.0/24"
            availability_zone = "us-east-1a"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbA-prod"
                environment = "production"
            }
        }
        DbB = {
            cidr_block = "172.16.8.0/24"
            availability_zone = "us-east-1b"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbB-prod"
                environment = "production"
            }
        }
        DbC = {
            cidr_block = "172.16.9.0/24"
            availability_zone = "us-east-1c"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbC-prod"
                environment = "production"
            }
        }
    }
}
