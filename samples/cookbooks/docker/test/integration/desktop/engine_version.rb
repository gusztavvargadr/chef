command_input = 'docker version'
command_output = 'Client:'

describe command(command_input) do
  its('stdout') { should include command_output }
end
