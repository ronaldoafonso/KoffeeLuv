
module "vpc" {
  source = "github.com/ronaldoafonso/KoffeeLuv-Modules//vpc?ref=vpc-0.0.2"

  vpc = {
    cidr_block = "172.16.0.0/16"
    tags = {
      name        = "koffeeluv-main-vpc-prod"
      environment = "production"
    }
  }

  subnets = {
    publicA = {
      cidr_block        = "172.16.1.0/24"
      availability_zone = "us-east-1a"
      public            = true

      tags = {
        name        = "koffeluv-publicA-public-subnet-prod"
        environment = "production"
      }
    }

    publicB = {
      cidr_block        = "172.16.2.0/24"
      availability_zone = "us-east-1b"
      public            = true

      tags = {
        name = "koffeeluv-publicB-public-subnet-prod"
        environment = "production"
      }
    }

    publicC = {
      cidr_block        = "172.16.3.0/24"
      availability_zone = "us-east-1c"
      public            = true

      tags = {
        name        = "koffeeluv-publicC-public-subnet-prod"
        environment = "production"
      }
    }

    AppA = {
      cidr_block        = "172.16.4.0/24"
      availability_zone = "us-east-1a"
      public            = false
      nat_gateway       = "publicA"

      tags = {
        name        = "koffeeluv-AppA-private-subnet-prod"
        environment = "production"
      }
    }

    AppB = {
      cidr_block        = "172.16.5.0/24"
      availability_zone = "us-east-1b"
      public            = false
      nat_gateway       = "publicB"

      tags = {
        name        = "koffeeluv-AppB-private-subnet-prod"
        environment = "production"
      }
    }

    AppC = {
      cidr_block        = "172.16.6.0/24"
      availability_zone = "us-east-1c"
      public            = false
      nat_gateway       = "publicC"

      tags = {
        name        = "koffeeluv-AppC-private-subnet-prod"
        environment = "production"
      }
    }

    DbA = {
      cidr_block        = "172.16.7.0/24"
      availability_zone = "us-east-1a"
      public            = false
      nat_gateway       = "publicA"

      tags = {
        name        = "koffeeluv-DbA-private-subnet-prod"
        environment = "production"
      }
    }

    DbB = {
      cidr_block        = "172.16.8.0/24"
      availability_zone = "us-east-1b"
      public            = false
      nat_gateway       = "publicB"

      tags = {
        name        = "koffeeluv-DbB-private-subnet-prod"
        environment = "production"
      }
    }

    DbC = {
      cidr_block        = "172.16.9.0/24"
      availability_zone = "us-east-1c"
      public            = false
      nat_gateway       = "publicC"

      tags = {
        name        = "koffeeluv-DbC-private-subnet-prod"
        environment = "production"
      }
    }
  }

  internet_gateway = {
    tags = {
      name        = "koffeeluv-igw-prod"
      environment = "production"
    }
  }

  nat_gateways = {
    us-east-1a = "publicA"
    us-east-1b = "publicB"
    us-east-1c = "publicC"
  }
}
