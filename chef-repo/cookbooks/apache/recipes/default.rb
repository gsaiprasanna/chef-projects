# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# 1. Install Apache
package "apache2" do 
	action :install
end
# 2. Start the Apache Service
service "apache2" do
	action [:enable,:start]
end
# 3. Create custom homepage
cookbook_file "/var/www/html/index.html" do
	source node["apache"]["indexfile"] 
	mode "0644"
end
	
