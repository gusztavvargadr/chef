command_input = 'vagrant --version'
command_output = 'Vagrant 2.2.17'

describe command(command_input) do
  its('stdout') { should include command_output }
end
