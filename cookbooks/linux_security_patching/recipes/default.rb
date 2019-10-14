#
# Cookbook Name:: linux_patching
# Recipe:: default
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

## Collect Prepatching system state
default.override['backup_file_extension']='prepatch'
include_recipe 'linux_security_patching::sysbackup'

## Execute patching
include_recipe 'linux_security_patching::patching'


# Reboot the system if case of any package update
reboot  'rebooting for maintenance activity' do
    action :run
    only_if 'rpmquery --last | grep "$(date +%d/" /"%b/" /"%Y)"'
end




