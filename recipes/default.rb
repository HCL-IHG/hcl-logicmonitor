#
# Cookbook:: hcl-logicmonitor
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
luser = node['lgmuser']['user']
lgroup = node['lgmuser']['group']
lurl = node['lgmuser']['url']

group lgroup do
  gid 1234
  group_name lgroup
  not_if "getent group #{lgroup}"
end

user luser do
  comment 'LogicMonitor local linux ssh account'
  uid 1234
  username luser
  gid lgroup
  home "/home/#{luser}"
  shell '/bin/bash'
  not_if "getent passwd #{luser}"
end

directory "/home/#{luser}" do
  owner luser
  group lgroup
  mode '0755'
  action :create
end


remote_file '/tmp/logicmonitor_hcl_ssh.tgz' do
  source lurl
  user   luser
  group  lgroup
  mode   '0444'
  action :create
end

execute "tar xvzf /tmp/logicmonitor_hcl_ssh.tgz" do
  cwd "/home/#{luser}"
  user luser
  group lgroup
end

template  "/etc/sudoers.d/#{luser}" do
  source  "#{luser}.erb"
  owner   'root'
  group   'root'
  mode    '0440'
  variables(
   username: luser
  )
end
