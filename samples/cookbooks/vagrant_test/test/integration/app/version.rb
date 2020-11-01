script_code = 'vagrant --version'
script_result = 'Vagrant '

describe command(script_code) do
  its('stdout') { should include script_result }
end
