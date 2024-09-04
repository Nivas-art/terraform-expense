resource "aws_ssm_parameter" "db_id" {
  name  = "/${var.project_name}/${var.environment}/db_sg_id"
  type  = "String"
  value = module.db.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/db_sg_id"
    }
  )
}

resource "aws_ssm_parameter" "backend_id" {
  name  = "/${var.project_name}/${var.environment}/backend_sg_id"
  type  = "String"
  value = module.backend.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/backend_sg_id"
    }
  )
}

resource "aws_ssm_parameter" "frontend_id" {
  name  = "/${var.project_name}/${var.environment}/frontend_sg_id"
  type  = "String"
  value = module.frontend.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/frontend_sg_id"
    }
  )
}

resource "aws_ssm_parameter" "bastion_id" {
  name  = "/${var.project_name}/${var.environment}/bastion_sg_id"
  type  = "String"
  value = module.bastion.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/bastion_sg_id"
    }
  )
}

resource "aws_ssm_parameter" "ansible_id" {
  name  = "/${var.project_name}/${var.environment}/ansible_sg_id"
  type  = "String"
  value = module.ansible.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/ansible_sg_id"
    }
  )
}