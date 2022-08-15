
region = "us-east-1"

project = "koffeeluv"

environment = "production"

vpc = {
  cidr_block = "172.16.0.0/16"
}

subnets = {
  publicA = {
    name              = "publicA"
    cidr_block        = "172.16.1.0/24"
    availability_zone = "us-east-1a"
    public            = "public"
  }
  publicB = {
    name              = "publicB"
    cidr_block        = "172.16.2.0/24"
    availability_zone = "us-east-1b"
    public            = "public"
  }
  publicC = {
    name              = "publicC"
    cidr_block        = "172.16.3.0/24"
    availability_zone = "us-east-1c"
    public            = "public"
  }
  AppA = {
    name              = "AppA"
    cidr_block        = "172.16.4.0/24"
    availability_zone = "us-east-1a"
    public            = "private"
  }
  AppB = {
    name              = "AppB"
    cidr_block        = "172.16.5.0/24"
    availability_zone = "us-east-1b"
    public            = "private"
  }
  AppC = {
    name              = "AppC"
    cidr_block        = "172.16.6.0/24"
    availability_zone = "us-east-1c"
    public            = "private"
  }
  DbA = {
    name              = "DbA"
    cidr_block        = "172.16.7.0/24"
    availability_zone = "us-east-1a"
    public            = "private"
  }
  DbB = {
    name              = "DbB"
    cidr_block        = "172.16.8.0/24"
    availability_zone = "us-east-1b"
    public            = "private"
  }
  DbC = {
    name              = "DbC"
    cidr_block        = "172.16.9.0/24"
    availability_zone = "us-east-1c"
    public            = "private"
  }
}

nat_gateways = {
  us-east-1a = "publicA"
  us-east-1b = "publicB"
  us-east-1c = "publicC"
}

instances = {
  bastionA = {
    name            = "bastionA"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "bastion"
    subnet          = "publicA"
    security_groups = ["ssh-all"]
  }
  bastionB = {
    name            = "bastionB"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "bastion"
    subnet          = "publicB"
    security_groups = ["ssh-all"]
  }
  bastionC = {
    name            = "bastionC"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "bastion"
    subnet          = "publicC"
    security_groups = ["ssh-all"]
  }
  appA = {
    name            = "appA"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "app"
    subnet          = "AppA"
    security_groups = ["ssh-publicA"]
  }
  appB = {
    name            = "appB"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "app"
    subnet          = "AppB"
    security_groups = ["ssh-publicB"]
  }
  appC = {
    name            = "appC"
    ami             = "ami-05fa00d4c63e32376"
    instance_type   = "t2.micro"
    key_name        = "app"
    subnet          = "AppB"
    security_groups = ["ssh-publicC"]
  }
}

security_groups = {
  ssh-all= {
    name        = "allow-ssh"
    description = "Allow SSH inbound traffic"

    ingress = {
      description      = "Allow SSH"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      name = "allow-ssh-security-group"
    }
  }
  ssh-publicA = {
    name        = "allow-ssh-from-publicA"
    description = "Allow SSH inbound traffic from publicA subnet"

    ingress = {
      description      = "Allow SSH from publicA subnet"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = ["172.16.1.0/24"]
      ipv6_cidr_blocks = ["::/0"] # IPv6 - This must be changed.
    }

    tags = {
      name = "allow-ssh-publicA-security-group"
    }
  }
  ssh-publicB = {
    name        = "allow-ssh-from-publicB"
    description = "Allow SSH inbound traffic from publicB subnet"

    ingress = {
      description      = "Allow SSH from publicB subnet"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = ["172.16.2.0/24"]
      ipv6_cidr_blocks = ["::/0"] # IPv6 - This must be changed.
    }

    tags = {
      name = "allow-ssh-publicB-security-group"
    }
  }
  ssh-publicC = {
    name        = "allow-ssh-from-publicC"
    description = "Allow SSH inbound traffic from publicC subnet"

    ingress = {
      description      = "Allow SSH from publicC subnet"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = ["172.16.3.0/24"]
      ipv6_cidr_blocks = ["::/0"] # IPv6 - This must be changed.
    }

    tags = {
      name = "allow-ssh-publicC-security-group"
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
