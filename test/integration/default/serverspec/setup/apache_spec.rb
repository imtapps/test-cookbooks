require 'serverspec'

describe command('apache2ctl configtest') do
  its(:stdout) { should match /\ASyntax OK\Z/ }
end

describe file('/var/www') do
  it { should be_directory }
end

describe file('/etc/apache2/sites-available/test_deploy.conf') do
  it { should contain "<VirtualHost *:80>" }
  it { should contain("ServerName test.imtapps.com") }
  it { should contain "ServerAdmin webadmin@imtapps.com" }
  it { should contain "WSGIScriptAlias / /var/www/test_deploy/current/test_deploy/wsgi.py" }
  it { should contain "WSGIDaemonProcess test.imtapps.com" }
  its(:content) { should match(/WSGIDaemonProcess.+ processes=10/) }
  its(:content) { should match(/WSGIDaemonProcess.+ threads=5/) }
  its(:content) { should match(/WSGIDaemonProcess.+ maximum-requests=1000/) }
  its(:content) { should match(/WSGIDaemonProcess.+ inactivity-timeout=60/) }
  its(:content) { should match(/WSGIDaemonProcess.+ deadlock-timeout=60/) }
  its(:content) { should match(/WSGIDaemonProcess.+ display-name=test.imtapps.com/) }
  its(:content) { should match(%r|WSGIDaemonProcess.+ python-path=/var/www/test_deploy/current/virtualenv/lib/python2.7/site-packages:/var/www/test_deploy/current|) }
  it { should contain "WSGIProcessGroup test.imtapps.com" }
end

describe file('/etc/apache2/sites-enabled/test_deploy.conf') do
  it { should be_linked_to '../sites-available/test_deploy.conf' }
end
