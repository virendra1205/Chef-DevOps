#
# Cookbook Name:: linux_patching
# Recipe:: patching
#
# Copyright (c) 2019 The Authors, All Rights Reserved.

## Exeute command to patch systemm
run_patch 'execute-patch' do 
  command_utils  'yum'
  repository_name "#{repository}"
  action :run
end
