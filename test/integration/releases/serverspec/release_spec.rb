require 'serverspec'

describe command('ls /var/www/test_deploy/releases') do
  its(:stdout) { should match /\A\d{14}\Z/ }
end
