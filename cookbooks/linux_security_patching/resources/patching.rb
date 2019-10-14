#### Custom resouce to apply secutrity patch on server
resource_name :run_patch

property :command_utils, String, default: 'yum'
property :repository_name, String
property :disable_repo, String, default: '*'

prefix = '/bin'

## Inherif chef execute property 
property :cwd, String
property :environment, Hash, default: {}
property :user, [String, Integer]
property :sensitive, [true, false], default: false

action :run do 
    execute 'execute-patch' do
        cwd cwd
        environment environment
        user user
        sensitive sensitive
        command <<-CODE
            #{prefix}/#{new_resource.command_utils} -y update --security --disablerepo=#{new_resource.disable_repo} --enablerepo=#{repository_name}
        CODE
    end
end

