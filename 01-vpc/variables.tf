variable "common_tags"{
   default = {
     Terraform = "true"
     Project = "expense"
     Environment = "dev"
}
}

variable "project_name"{
    default = "expense"  
}
 variable "environment"{
    default = "dev"
 }


variable "public_subnet_cidrs"{
    default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "private_subnet_cidrs"{
    default = ["10.0.11.0/24","10.0.21.0/24"]
}

variable "database_subnet_cidrs"{
    default = ["10.0.31.0/24","10.0.41.0/24"]
}

variable "accepter_vpc_id"{
    default = ""
}
variable "is_peering_required"{
    type = bool
    default = true
}

