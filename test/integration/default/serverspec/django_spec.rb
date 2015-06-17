require 'serverspec'

dir = '/var/www/test_deploy/current'

describe command("#{dir}/virtualenv/bin/python #{dir}/manage.py deployed migrate --list") do
  its(:stdout) { should contain '\[X\]' }
  its(:stdout) { should_not contain '\[\s\]' }
end

describe file("#{dir}/static/demo") do
  it { should be_directory }
end

describe command("ls #{dir}/static/demo") do
  its(:stdout) { should contain 'demo.js' }
  its(:stdout) { should contain 'demo.css' }
end

describe file("#{dir}/demo/locale/en/LC_MESSAGES/django.mo") do
  it { should be_file }
end
