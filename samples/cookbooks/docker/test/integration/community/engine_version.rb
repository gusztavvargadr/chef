command_input = 'docker version'
command_output = 'Server:'

describe command(command_input) do
  its('stdout') { should include command_output }
end
