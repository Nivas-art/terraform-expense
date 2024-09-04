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


## ["id1","id2"]-->list, terraform accepts like this only
## id1,id2--->string, aws accpets like this only
##so we need to convert from ["id1","id2"] into id1,id2
resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",",module.vpc.public_subnet_id)

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/public_subnet_ids"
    }
  )
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",",module.vpc.private_subnet_id)

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/private_subnet_ids"
    }
  )
}


##db subnet group name
resource "aws_ssm_parameter" "db_subnet_group_name" {
  name  = "/${var.project_name}/${var.environment}/db_subnet_group_name"
  type  = "String"
  value = module.vpc.aws_db_subnet_group

  tags = merge(
    var.common_tags,
    {
        Name = "/${var.project_name}/${var.environment}/db_subnet_group_name"
    }
  )
}