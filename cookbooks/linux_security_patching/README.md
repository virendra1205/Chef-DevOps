# linux_patching

This cookbook will only apply the security patching on Linux server of type
Oracle Linux, RHEL, Centos and Fedora which works on RPM based package managment. 


# Execution 
    Pull the code through chef client on any of Linux environment which is part of chef server and cookbook is upladed to chef server.
    # chef-client -o 'linux_security_patching::default' 
                    OR
    # chef-client -o 'linux_security_patching' 

# Recipes 
    It has total 3 recipes, they are as follows :-
     - default.rb   
            It is run other recipe to get the patching job done in sequence and reboot at the end.
     - sysbackup.rb
            Collect the system configuration backup from servers and store in path, this outputs are required to trubleshoot in case of any failure from OS side after patching.
     - patching.rb
            This is actull patching which actully run the custom resource to run patching by different properties provided like utility [yum / zyper], repository names
 
# attributes 
       Attributes has major platform version, You may specify the respository name again attribute to pull the source while patching.
