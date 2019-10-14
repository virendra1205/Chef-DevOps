default['backup_path']="/tmp/#{node['fqdn']}"
default['backup_file_extension']=''

case node['platform_version'].to_i
    when 5
        default[repository]=''
    when 6
        default[repository]=''
    when 7 
        default[repository]=''
    when 8
        default[repository]=''
end
