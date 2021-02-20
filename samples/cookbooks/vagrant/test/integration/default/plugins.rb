command_input = 'vagrant plugin list'
command_output = 'vagrant-sshfs'

describe command(command_input) do
  its('stdout') { should include command_output }
end
