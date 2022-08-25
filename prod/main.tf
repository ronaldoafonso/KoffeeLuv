
module "vpc" {
  source = "github.com/ronaldoafonso/koffeeluv-vpc?ref=v1.0.0"

  environment = var.environment

  vpc = {
    cidr_block = var.vpc.cidr_block

    tags = {
      name = "${var.project}-main-vpc-${var.environment}"
    }
  }

  subnets = {
    publicA = {
      cidr_block        = var.subnets.publicA.cidr_block
      availability_zone = var.subnets.publicA.availability_zone
      public            = var.subnets.publicA.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.publicA.name}-${var.subnets.publicA.public}-subnet-${var.environment}"
      }
    }

    publicB = {
      cidr_block        = var.subnets.publicB.cidr_block
      availability_zone = var.subnets.publicB.availability_zone
      public            = var.subnets.publicB.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.publicB.name}-${var.subnets.publicB.public}-subnet-${var.environment}"
      }
    }

    publicC = {
      cidr_block        = var.subnets.publicC.cidr_block
      availability_zone = var.subnets.publicC.availability_zone
      public            = var.subnets.publicC.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.publicC.name}-${var.subnets.publicC.public}-subnet-${var.environment}"
      }
    }

    AppA = {
      cidr_block        = var.subnets.AppA.cidr_block
      availability_zone = var.subnets.AppA.availability_zone
      public            = var.subnets.AppA.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.AppA.name}-${var.subnets.AppA.public}-subnet-${var.environment}"
      }
    }

    AppB = {
      cidr_block        = var.subnets.AppB.cidr_block
      availability_zone = var.subnets.AppB.availability_zone
      public            = var.subnets.AppB.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.AppB.name}-${var.subnets.AppB.public}-subnet-${var.environment}"
      }
    }

    AppC = {
      cidr_block        = var.subnets.AppC.cidr_block
      availability_zone = var.subnets.AppC.availability_zone
      public            = var.subnets.AppC.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.AppC.name}-${var.subnets.AppC.public}-subnet-${var.environment}"
      }
    }

    DbA = {
      cidr_block        = var.subnets.DbA.cidr_block
      availability_zone = var.subnets.DbA.availability_zone
      public            = var.subnets.DbA.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.DbA.name}-${var.subnets.DbA.public}-subnet-${var.environment}"
      }
    }

    DbB = {
      cidr_block        = var.subnets.DbB.cidr_block
      availability_zone = var.subnets.DbB.availability_zone
      public            = var.subnets.DbB.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.DbB.name}-${var.subnets.DbB.public}-subnet-${var.environment}"
      }
    }

    DbC = {
      cidr_block        = var.subnets.DbC.cidr_block
      availability_zone = var.subnets.DbC.availability_zone
      public            = var.subnets.DbC.public == "public" ? true : false

      tags = {
        name = "${var.project}-${var.subnets.DbC.name}-${var.subnets.DbC.public}-subnet-${var.environment}"
      }
    }
  }

  internet_gateway = {
    tags = {
      name = "${var.project}-igw-${var.environment}"
    }
  }

  nat_gateways = var.nat_gateways
}

module "ec2" {
  source = "github.com/ronaldoafonso/koffeeluv-ec2?ref=v1.0.0"

  environment     = var.environment
  instances       = var.instances
  security_groups = var.security_groups
  key_pairs       = var.key_pairs
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.subnets
}
