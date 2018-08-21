script_code = 'docker image ls -a'
script_result = 'hello-world'

describe powershell(script_code) do
  its('stdout') { should include script_result }
end
