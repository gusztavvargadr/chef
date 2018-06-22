script_code = 'docker version'
script_result = 'Client:'

describe powershell(script_code) do
  its('stdout') { should include script_result }
end
