#
# Cookbook Name:: linux_patching
# Recipe:: sysbackup
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

###Directory for backing up system data before and apfter patch for system validation
directory "#{node['backup_path']}" do
  mode '0755'
  owner 'root'
  group 'root'
  action :create
  only_if { Dir.exist?("#{node['backup_path']}") }
end

##Taking Backup
bash 'Collect system state' do
  code <==EOH
  ## starting bash script to run
    rpm -qa >> "#{node['backup_path']}"/rpm."#{node['backup_file_extension']}"
    uname -a >> "#{node['backup_path']}"/uname_a."#{node['backup_file_extension']}"
    cp -a /etc/fstab "#{node['backup_path']}"/fstab."#{node['backup_file_extension']}"
    cp /boot/grub*/grub*.conf "#{node['backup_path']}"/grub."#{node['backup_file_extension']}"
    vgs >> "#{node['backup_path']}"/vgs."#{node['backup_file_extension']}"
    lvs >> "#{node['backup_path']}"/lvs."#{node['backup_file_extension']}"
    pvs >> "#{node['backup_path']}"/pvs."#{node['backup_file_extension']}"
    ## You may add more line if you want based on your infrasture and requirement.
  EOH
  action :run
end
