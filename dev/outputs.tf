
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instances" {
  value = merge({for key, instance in module.ec2.instances: key=>instance.public_ip  if instance.public_ip != ""},
                {for key, instance in module.ec2.instances: key=>instance.private_ip if instance.public_ip == ""})
}

output "repositories" {
  value = {for key, repository in module.containers.repositories: key=>repository.repository_url}
}
