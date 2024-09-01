variable "sg_name"{
    default = "expense-dev-db"
}

variable "description_name"{
    default = "sg for db"
}

variable "project_name"{
    default = "expense"
}

variable "environment"{
    default = "dev"
}

variable "common_tags"{
    default = {
        Terraform = "true"
        Environment = "dev"
    }
}
