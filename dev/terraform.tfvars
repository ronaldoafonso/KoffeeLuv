
region = "us-east-2"

project = "koffeeluv"

environment = "development"

vpc = {
  cidr_block = "172.16.0.0/16"
}

subnets = {
  publicA = {
    name              = "publicA"
    cidr_block        = "172.16.1.0/24"
    availability_zone = "us-east-2a"
    public            = "public"
  }
  publicB = {
    name              = "publicB"
    cidr_block        = "172.16.2.0/24"
    availability_zone = "us-east-2b"
    public            = "public"
  }
  publicC = {
    name              = "publicC"
    cidr_block        = "172.16.3.0/24"
    availability_zone = "us-east-2c"
    public            = "public"
  }
  AppA = {
    name              = "AppA"
    cidr_block        = "172.16.4.0/24"
    availability_zone = "us-east-2a"
    public            = "private"
  }
  AppB = {
    name              = "AppB"
    cidr_block        = "172.16.5.0/24"
    availability_zone = "us-east-2b"
    public            = "private"
  }
  AppC = {
    name              = "AppC"
    cidr_block        = "172.16.6.0/24"
    availability_zone = "us-east-2c"
    public            = "private"
  }
  DbA = {
    name              = "DbA"
    cidr_block        = "172.16.7.0/24"
    availability_zone = "us-east-2a"
    public            = "private"
  }
  DbB = {
    name              = "DbB"
    cidr_block        = "172.16.8.0/24"
    availability_zone = "us-east-2b"
    public            = "private"
  }
  DbC = {
    name              = "DbC"
    cidr_block        = "172.16.9.0/24"
    availability_zone = "us-east-2c"
    public            = "private"
  }
}

nat_gateways = {
  us-east-2a = "publicA"
  us-east-2b = "publicB"
  us-east-2c = "publicC"
}

instances = {
  bastionA = {
    name            = "bastionA"
    ami             = "ami-0b6eb081f3e4adf90"
    instance_type   = "a1.medium"
    key_name        = "bastion"
    subnet          = "publicA"
    security_groups = ["bastion"]
  }
  bastionB = {
    name            = "bastionB"
    ami             = "ami-0b6eb081f3e4adf90"
    instance_type   = "a1.medium"
    key_name        = "bastion"
    subnet          = "publicB"
    security_groups = ["bastion"]
  }
  bastionC = {
    name            = "bastionC"
    ami             = "ami-051dfed8f67f095f5"
    instance_type   = "t2.micro"
    key_name        = "bastion"
    subnet          = "publicC"
    security_groups = ["bastion"]
  }
}

security_groups = {
  bastion = {
    name        = "bastion"
    description = "Allow SSH inbound traffic for bastion hosts."

    ingress = {
      description      = "Allow SSH from all"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    egress = {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      name = "bastion-security-group"
    }
  }
  internet-to-loadbalancer = {
    name        = "internet-to-loadbalancer"
    description = "Allow HTTP inbound traffic from the Internet"

    ingress = {
      description      = "Allow HTTP from the Internet"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    egress = {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      name = "loadbalancer-security-group"
    }
  }
  ecs-instances = {
    name        = "ecs-instances"
    description = "Allow HTTP inbound traffic from private subnets"

    ingress = {
      description      = "Allow HTTP from private subnets"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["172.16.0.0/16"]
      ipv6_cidr_blocks = ["::/0"] # IPv6 - This must be changed.
    }

    egress = {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      name = "ecs-instances-security-group"
    }
  }
}

key_pairs = {
  bastion = {
    name       = "bastion"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQsKmjTrTZbhPE5ijfeqIWOBOtnFXBhgU/pwIZ/+V25mCKdE7rXG7LtT6sufQHU4Up4YqRHPe5XPUgj+hfpiMHCjTxGRjXlM/G6BTfYzK4Gpnx7UOw8rcSPzqPC6ncbyfNBtjCmcgK1wWODPie63yM9FauD2VCXZULAfyJlH/W1I1zFwa6iKGzJWb2rFrAEVA2siDklC33znxirc9dKR3jQJxFAXfdaY4j0bvshPeVndNcUv+uW+KL3IEyUtvuO4cFGbXMzmcqcdVz0rxxuSjTlNpcyh0HyvbIWSL3Rr7njQalboXwEn4mpQ3EcGqufy82uFWRFjV5N7T5ooXrcWwvd06JIct+TtILymr1Xq07xpJ1l7z82pe5g3RuaJYnzzV7YQkVHIZ5gVFFip8dyBBkclfJz++viGJsWCwEDi3ibAsgN4KCQBq/Foa88KOUw0LlyJ28guTXP+W73Y95xE5ND5J0yDRw5xg9gG/S8rmQ7K+tCaQMKWk1zC+7udhJmas= bastion"
  }
  app = {
    name       = "app"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyTcg36y/YMyWFNfask1H0dYSe1jHpGBQRvUEvHi+S9xfgy431hxUlJFi8XmEMMjJoUuzCLdWF/Eo0Z8GOecBMFegwGG/xBYVGbgaaprhAPqZBsf5BPw0hHFdVfBDpF2YaYUttkl3GZ071YhQg/gV3q8jr9sfo9IttA/Mm/9h5mIxcYS7xCWjkISMd5jDMkbssqh3z0SDuyvxDRz6j/0qR57htWKSnc37VaDA0N7kY+E4cdgUonewxQy/lvniD9L1y+i8k3U32jtBqz9dLQT0Zhdx/vOP6hQyRY/6aw9opGYbuDln8uqgIbDiTTXt8TVOrdNoGo5sK/rkBzNAYzsoO6UenYLMrKalh8yRq/pa4tuFf3cLoQ1u/VwUHjbjPoWc8CsLvqPYqAYZKhDJ41VflnN+nNdfRH5GwQ/hVhq9oj3AsDx8gh4MUiZ/E1/bKXQVIG+rNaeOAjyvw/qtu3YSW2TGz4J2+zW3qMp7pXQ+fdhoI7IIT8oKscYjdS6SbSJc= app"
  }
}

containers = {
  container1 = {
    name = "koffeeluv"
  }
}

cluster = {
  name = "koffeeluv-ecs-cluster"
}

service = {
  name = "koffeeluv-ecs-service"
  desired_count = 1
}

task_definition = {
  name = "koffeeluv-task-definition"
  family = "koffeeluv-family"
  image = "685616003259.dkr.ecr.us-east-2.amazonaws.com/koffeeluv:0.0.1"
  account = "685616003259"
  memory = 256
  network_mode = "bridge"
  container_port = 8080
  host_port = 8080
}
