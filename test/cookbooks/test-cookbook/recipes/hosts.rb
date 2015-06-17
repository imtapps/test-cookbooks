cookbook_file '/etc/hosts' do
  source 'hosts'
  owner 'root'
  group 'root'
  mode '644'
end
