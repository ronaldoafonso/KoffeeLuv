
module "vpc" {
  source = "github.com/ronaldoafonso/KoffeeLuv-Modules//vpc?ref=ISSUE-2"

  vpc = {
    cidr_block = "172.16.0.0/16"

    tags = {
      name        = "koffeeluv-main-vpc-dev"
      environment = "development"
    }
  }

  subnets = {
    publicA = {
      cidr_block        = "172.16.1.0/24"
      availability_zone = "us-east-2a"
      public            = true

      tags = {
        name        = "koffeluv-publicA-puclic-subnet-dev"
        environment = "development"
      }
    }

    publicB = {
      cidr_block        = "172.16.2.0/24"
      availability_zone = "us-east-2b"
      public            = true

      tags = {
        name        = "koffeeluv-publicB-public-subnet-dev"
        environment = "development"
      }
    }

    publicC = {
      cidr_block        = "172.16.3.0/24"
      availability_zone = "us-east-2c"
      public            = true

      tags = {
        name        = "koffeeluv-publicC-public-subnet-dev"
        environment = "development"
      }
    }

    AppA = {
      cidr_block        = "172.16.4.0/24"
      availability_zone = "us-east-2a"
      public            = false
      nat_gateway       = "publicA"

      tags = {
        name        = "koffeeluv-AppA-private-subnet-dev"
        environment = "development"
      }
    }

    AppB = {
      cidr_block        = "172.16.5.0/24"
      availability_zone = "us-east-2b"
      public            = false
      nat_gateway       = "publicB"

      tags = {
        name        = "koffeeluv-AppB-private-subnet-dev"
        environment = "development"
      }
    }

    AppC = {
      cidr_block        = "172.16.6.0/24"
      availability_zone = "us-east-2c"
      public            = false
      nat_gateway       = "publicC"

      tags = {
        name        = "koffeeluv-AppC-private-subnet-dev"
        environment = "development"
      }
    }

    DbA = {
      cidr_block        = "172.16.7.0/24"
      availability_zone = "us-east-2a"
      public            = false
      nat_gateway       = "publicA"

      tags = {
        name        = "koffeeluv-DbA-private-subnet-dev"
        environment = "development"
      }
    }

    DbB = {
      cidr_block        = "172.16.8.0/24"
      availability_zone = "us-east-2b"
      public            = false
      nat_gateway       = "publicB"

      tags = {
        name        = "koffeeluv-DbB-private-subnet-dev"
        environment = "development"
      }
    }

    DbC = {
      cidr_block        = "172.16.9.0/24"
      availability_zone = "us-east-2c"
      public            = false
      nat_gateway       = "publicC"

      tags = {
        name        = "koffeeluv-DbC-private-subnet-dev"
        environment = "development"
      }
    }
  }

  internet_gateway = {
    tags = {
      name        = "koffeeluv-igw-dev"
      environment = "development"
    }
  }

  nat_gateways = {
    us-east-2a = "publicA"
    us-east-2b = "publicB"
    us-east-2c = "publicC"
  }
}
