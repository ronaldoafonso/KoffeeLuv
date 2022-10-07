
locals {
  asg = {
    key_name = "app"
    security_group_ids = [module.security.security_groups["ecs-instances"].id]
    subnet_ids         = [for id,subnet in module.vpc.subnets: subnet.id if startswith(id, "App")]
  }

  lb = {
    name               = "koffeeluv-lb"
    internal           = false
    load_balancer_type = "application"
    security_group_ids = [module.security.security_groups["internet-to-loadbalancer"].id]
    subnet_ids         = [for id,subnet in module.vpc.subnets: subnet.id if startswith(id, "public")]

    listener = {
      port     = 80
      protocol = "HTTP"

      default_action = {
        type = "forward"
      }
    }

    target_group = {
      name     = "koffeeluv-lb-target-group"
      port     = 8080
      protocol = "HTTP"
      vpc_id   = module.vpc.vpc_id
    }

    autoscaling_group = {
      id = module.cluster.autoscaling_group.id
    }
  }
}
