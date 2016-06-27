Requirements
------------

* VirtualBox 5.0.22
* Ansible 2.1.0.0
* Vagrant 1.8.4
* Plugin Vagrant: vagrant-hostmanager (1.8.2)
* Plugin Vagrant: vagrant-timezone (1.1.0)

Directories
------------

* inventory - Templates inventory files to be used in playbooks
* roles - Sample roles structure organized by type of configurations allowing great use and modularity
* playbooks - Playbooks ansible for instalation. This playbooks call the roles, organizing the server group to be affected

Steps
-----

For provide VirtualMachine via Vagrant + VirtualBox (opcional):

vagrant up

For configure Hosts with the playbook:

Generate inventory - Copy file inventory/hosts and modify the information with your data about host to be configure

copy inventory/hosts.tmpl inventory/hosts

Execute playbook:

ansible-playbook -i inventory/hosts playbook/config.yml

Author Information
------------------
Geovana Possenti de Souza - geovana.possenti@gmail.com
