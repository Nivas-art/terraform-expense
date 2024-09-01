resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/vpc_id"
    }
  )
}