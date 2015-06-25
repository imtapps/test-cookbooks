package 'git'

directory '/var/www/'

include_recipe "python::virtualenv"
python_virtualenv '/var/www/base_virtualenv' do
  action :create
end

package 'apache2'
package 'libapache2-mod-wsgi'

template "/etc/apache2/sites-available/test_deploy.conf" do
  source 'site.conf.erb'
end

execute 'a2ensite test_deploy.conf' do
  command '/usr/sbin/a2ensite test_deploy.conf'
  notifies :reload, 'service[apache2]'
end

service 'apache2' do
  service_name 'apache2'
  supports [:start, :restart, :reload, :status]
  action [:enable, :start]
end
