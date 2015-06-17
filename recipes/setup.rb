package 'git'

directory '/var/www/'

include_recipe "python::virtualenv"
python_virtualenv '/var/www/base_virtualenv' do
  action :create
end

include_recipe "apache2::default"
include_recipe "apache2::mod_wsgi"
web_app 'test_deploy' do
  template 'site.conf.erb'
  cookbook 'opsworks-cookbooks'
end
