# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    ####################################################################################################################
    # basebox
    ####################################################################################################################
    config.vm.box = "base"

    ####################################################################################################################
    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    #
    # Puppetlab's official box (w/ Puppet & Chef installed)
    ####################################################################################################################
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

    ####################################################################################################################
    # CouchDB
    ####################################################################################################################

    config.vm.define :couchdb do |couchdb|
        couchdb.vm.box = "couchdb"
        couchdb.vm.network :private_network, ip: "192.168.50.10"
        couchdb.vm.synced_folder "shared", "/vagrant_data"

        # box name
        couchdb.vm.provider "virtualbox" do |v|
            v.name = "CouchDB"
        end

        # Puppet
        couchdb.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests/couchdb"
            puppet.manifest_file  = "init.pp"
            puppet.module_path = [ 'modules' ]
            puppet.option = [
                '--verbose'
            ]
        end
    end

end
