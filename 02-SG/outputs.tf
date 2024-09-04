output "sg_id"{
    value = module.db.sg_id
}

output "backend_id"{
    value = module.backend.sg_id
}

output "frontend_id"{
    value = module.frontend.sg_id
}

output "bastion_id"{
    value = module.bastion.sg_id
}

output "ansible_id"{
    value = module.ansible.sg_id
}