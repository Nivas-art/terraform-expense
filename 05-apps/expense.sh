!/bin/bash
dnf install ansible -y
cd /tmp/
git clone https://github.com/Nivas-art/project-onroles.git
cd project-onroles
ansible-playbook main.yaml -e component=backend -e login_password=ExpenseApp1


