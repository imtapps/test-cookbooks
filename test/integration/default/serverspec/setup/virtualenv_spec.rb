require 'serverspec'

describe command('/var/www/base_virtualenv/bin/python --version') do
  its(:stdout) { should match /\APython 2.7.6\Z/ }
end

