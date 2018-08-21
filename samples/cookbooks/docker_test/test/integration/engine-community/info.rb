script_code = 'docker info'
script_result = 'Containers:'

describe powershell(script_code) do
  its('stdout') { should include script_result }
end
