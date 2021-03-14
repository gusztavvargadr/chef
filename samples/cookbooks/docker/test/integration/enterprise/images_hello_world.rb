command_input = 'docker image ls -a'
command_output = 'hello-world'

describe command(command_input) do
  its('stdout') { should include command_output }
end
