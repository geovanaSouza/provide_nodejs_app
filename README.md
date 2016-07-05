Requirements
------------

* VirtualBox 5.0.22
* Ansible 2.1.0.0
* Vagrant 1.8.4
* Plugin Vagrant: vagrant-hostmanager (1.8.2)

Directories
------------

* inventory - Inventory files templates to be used in playbooks
* roles - Sample roles structure organized by type of configurations allowing great use and modularity
* playbooks - Playbooks ansible for instalation. This playbooks call the roles, organizing the server group to be affected

Steps
-----

Configure host inventory for the playbook:

Generate inventory - Copy file inventory/hosts.tmpl and modify the information with your data about host to be configured

cp inventory/hosts.tmpl inventory/hosts

For provide VirtualMachine via Vagrant + VirtualBox configuring with ansible (opcional):

vagrant up

Execute playbook (only if dont use the vagrant):

ansible-playbook -i inventory/hosts playbook/config.yml

Stress Test
-----------

Requirements:

* apache2-utils ( apt-get install apache2-utils)
* gnuplot-x11

Execution example:
cd scripts

./stress_test.sh 1000 50 true http://hl_world.192.168.33.10.xip.io/

Parameters:

* 1 - requests_number
* 2 - concorrency_number
* 3 - keep_alive (true|false)
* 4 - url

Author Information
------------------
Geovana Possenti de Souza - geovana.possenti@gmail.com
