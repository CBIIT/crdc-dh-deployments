#global proj variables
project = "crdc-dh"
tags = {
  Project = "crdc-dh"
  CreatedWith = "Terraform"
  POC = "ye.wu@nih.gov"
  Environment = "dev"
}
vpc_id = "vpc-29a12251"
public_subnet_ids = []
private_subnet_ids = [
  "subnet-4f35f112",
  "subnet-409a0424"
]
#cloud platform
target_account_cloudone = true

#instance profile
create_instance_profile = false

#ALB values
internal_alb = true
#lb_type= default=application
certificate_domain_name = "*.datacommons.cancer.gov"
domain_name="datacommons.cancer.gov"

allowed_ip_blocks = ["10.208.6.0/23","10.208.2.0/23"]

region = "us-east-1"

microservices  = {
  frontend = {
    name = "frontend"
    port = 80
    health_check_path = "/"
    priority_rule_number = 22
    image_url = "cbiitssrepo/bento-frontend:latest"
    cpu = 256
    memory = 512
    path = ["/*"]
    number_container_replicas = 1
  },
  backend = {
    name = "backend"
    port = 8080
    health_check_path = "/ping"
    priority_rule_number = 20
    image_url = "cbiitssrepo/bento-backend:latest"
    cpu = 512
    memory = 1024
    path = ["/v1/graphql/*","/version"]
    number_container_replicas = 1
  }
}
#monitoring
sumologic_access_id = "suufmmqKgJ19ZA"
sumologic_access_key = "CzQtbpwa8Zyn0fnp8SQkx51afq9nl4Zma1Q5xxmD4UcZzlv6Gmmrz7ZuRMeIBgwl"
