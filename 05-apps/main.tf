module "backend_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-backend"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.backend_id.value]
  subnet_id              = local.private_subnet_id
  ami = data.aws_ami.ami_info.id

  tags = merge(
    var.common_tags,
    {
    Name = "${var.project_name}-${var.environment}-backend"
  }
  )
}

module "frontend_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-frontend"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.frontend_id.value]
  subnet_id              = local.public_subnet_id
  ami = data.aws_ami.ami_info.id

  tags = merge(
    var.common_tags,
    {
    Name = "${var.project_name}-${var.environment}-frontend"
  }
  )
}

module "ansible_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-ansible"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.ansible_id.value]
  subnet_id              = local.public_subnet_id
  ami = data.aws_ami.ami_info.id
  user_data = file("expense.sh")
  tags = merge(
    var.common_tags,
    {
    Name = "${var.project_name}-${var.environment}-ansible"
  }
  )
  depends_on = [module.backend_server,module.frontend_server]
}

##r53 records

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "backend"
      type    = "A"
      ttl = 1
      records = [module.backend_server.private_ip]
    },
    {
      name    = "frontend"
      type    = "A"
      ttl     = 3600
      records = [
        module.frontend_server.private_ip
      ]
    },
     {
      name    = ""#devops-srinu.online
      type    = "A"
      ttl     = 1
      records = [
        module.ansible_server.public_ip
      ]
    }
  ]

  #depends_on = [module.zones]
}