#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# 
file 'etc/motd' do
  	content '<html> This is a placeholder for the homepage.</html>'
	mode '0755'
	owner 'saiprasanna'
	group 'saiprasanna'
end
