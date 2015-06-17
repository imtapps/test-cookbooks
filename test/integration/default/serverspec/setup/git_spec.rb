require 'serverspec'

describe command('git --version') do
  its(:stdout) { should match /\Agit version 1.9.1\Z/ }
end
