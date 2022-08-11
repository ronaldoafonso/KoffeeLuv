
region = "us-east-1"

project = "koffeeluv"

environment = "production"

vpc = {
  cidr_block = "172.16.0.0/16"
}

subnets = {
  publicA = {
    name = "publicA"
    cidr_block = "172.16.1.0/24"
    availability_zone = "us-east-1a"
    public = "public"
  }
  publicB = {
    name = "publicB"
    cidr_block = "172.16.2.0/24"
    availability_zone = "us-east-1b"
    public = "public"
  }
  publicC = {
    name = "publicC"
    cidr_block = "172.16.3.0/24"
    availability_zone = "us-east-1c"
    public = "public"
  }
  AppA = {
    name = "AppA"
    cidr_block = "172.16.4.0/24"
    availability_zone = "us-east-1a"
    public = "private"
  }
  AppB = {
    name = "AppB"
    cidr_block = "172.16.5.0/24"
    availability_zone = "us-east-1b"
    public = "private"
  }
  AppC = {
    name = "AppC"
    cidr_block = "172.16.6.0/24"
    availability_zone = "us-east-1c"
    public = "private"
  }
  DbA = {
    name = "DbA"
    cidr_block = "172.16.7.0/24"
    availability_zone = "us-east-1a"
    public = "private"
  }
  DbB = {
    name = "DbB"
    cidr_block = "172.16.8.0/24"
    availability_zone = "us-east-1b"
    public = "private"
  }
  DbC = {
    name = "DbC"
    cidr_block = "172.16.9.0/24"
    availability_zone = "us-east-1c"
    public = "private"
  }
}
