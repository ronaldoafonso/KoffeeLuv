
module "vpc" {
    source = "github.com/ronaldoafonso/KoffeeLuv-Modules//vpc?ref=vpc-0.0.1"

    vpc = {
        cidr_block = "172.16.0.0/16"
        tags = {
            name = "koffeeluv-main-dev"
            environment = "development"
        }
    }

    subnets = {
        publicA = {
            cidr_block = "172.16.1.0/24"
            availability_zone = "us-east-2a"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeluv-publicA-dev"
                environment = "development"
            }
        }
        publicB = {
            cidr_block = "172.16.2.0/24"
            availability_zone = "us-east-2b"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeeluv-publicB-dev"
                environment = "development"
            }
        }
        publicC = {
            cidr_block = "172.16.3.0/24"
            availability_zone = "us-east-2c"
            map_public_ip_on_launch = true
            tags = {
                name = "koffeeluv-publicC-dev"
                environment = "development"
            }
        }
        AppA = {
            cidr_block = "172.16.4.0/24"
            availability_zone = "us-east-2a"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppA-dev"
                environment = "development"
            }
        }
        AppB = {
            cidr_block = "172.16.5.0/24"
            availability_zone = "us-east-2b"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppB-dev"
                environment = "development"
            }
        }
        AppC = {
            cidr_block = "172.16.6.0/24"
            availability_zone = "us-east-2c"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-AppC-dev"
                environment = "development"
            }
        }
        DbA = {
            cidr_block = "172.16.7.0/24"
            availability_zone = "us-east-2a"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbA-dev"
                environment = "development"
            }
        }
        DbB = {
            cidr_block = "172.16.8.0/24"
            availability_zone = "us-east-2b"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbB-dev"
                environment = "development"
            }
        }
        DbC = {
            cidr_block = "172.16.9.0/24"
            availability_zone = "us-east-2c"
            map_public_ip_on_launch = false
            tags = {
                name = "koffeeluv-DbC-dev"
                environment = "development"
            }
        }
    }
}
