require 'serverspec'

describe file('/var/www/test_deploy/current') do
  it { should be_symlink }
  it { should be_linked_to "/var/www/test_deploy/releases/#{`ls /var/www/test_deploy/releases/`.strip}" }
end

describe file('/var/www/test_deploy/current/test_deploy/wsgi.py') do
  its(:content) { should contain 'application = get_wsgi_application()' }
end

describe command('git --work-tree=/var/www/test_deploy/current --git-dir=/var/www/test_deploy/current/.git remote -v') do
  its(:stdout) { should contain 'github.com/mattjmorrison/test_deploy.git' }
end

describe file('/var/www/test_deploy/current/test_deploy/settings/deployed.py') do
  it { should be_symlink }
  it { should be_linked_to '/var/www/test_deploy/releases/../current/test_deploy/settings/production.py' }
end

describe command('/var/www/test_deploy/current/virtualenv/bin/python --version') do
  its(:stdout) { should match /\APython 2.7.6\Z/ }
end

describe command('/var/www/test_deploy/current/virtualenv/bin/pip freeze') do
  its(:stdout) { should contain 'Django==1.8' }
end
