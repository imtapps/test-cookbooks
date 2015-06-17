release node[:opsworks_cookbooks][:name] do
  repo 'https://github.com/mattjmorrison/test_deploy.git'
  environment 'production'
end
