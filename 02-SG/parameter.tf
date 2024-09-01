resource "aws_ssm_parameter" "sg_id" {
  name  = "/${var.project_name}/${var.environment}/sg_id"
  type  = "String"
  value = module.db.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/sg_id"
    }
  )
}

resource "aws_ssm_parameter" "backend_id" {
  name  = "/${var.project_name}/${var.environment}/backend_id"
  type  = "String"
  value = module.backend.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/backend_id"
    }
  )
}

resource "aws_ssm_parameter" "frontend_id" {
  name  = "/${var.project_name}/${var.environment}/frontend_id"
  type  = "String"
  value = module.frontend.sg_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/frontend_id"
    }
  )
}