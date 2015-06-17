require 'serverspec'

describe command('wget -q -O - http://test.imtapps.com') do

  its(:stdout) { should match(%r|<h1>Hi!</h1>|) }

end
