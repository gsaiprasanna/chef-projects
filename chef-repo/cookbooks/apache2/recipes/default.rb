#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service "apache2" do 
       action :nothing 
end

if node['platform']== "ubuntu" 
       package ["apache2"] do
        action :install
end
end

if node['platform']== "centos"
       package ["httpd"] do
        action :install
end
end

node["apache"]["sites"].each do |site_name,site_data|
     document_root="/var/www/#{site_name}"
     directory document_root do 
         mode 0755
         recursive true
       end

       if node["platform"] == "ubuntu"
	      template "/etc/apache2/ports.conf" do
	      source "ports.conf.erb"
              mode "0644"
              variables(
                       :port => site_data["port"]
                        )
       end

	      template "/etc/apache2/sites-available/#{site_name}.conf" do
	      source "customsite.erb"
              mode "0644"
              variables(
                       :port => site_data["port"],
                       :document_root => document_root
                        )

       end
       template "#{document_root}/index.html" do
                source "index.html.erb"
                mode "0644"
                variables(
                       :site_name => site_name,
                       :port => site_data["port"],
                       :document_root => document_root
                        )
                end
              	execute "enabling site #{site_name}" do
                        command "a2ensite  #{site_name}"
			action :run
                        notifies :restart, "service[apache2]"
                end 
end
end
