command_input = 'vagrant box list'
command_output = 'gusztavvargadr/ubuntu-server'

describe command(command_input) do
  its('stdout') { should include command_output }
end
