script_code = 'docker version'
script_result = 'Server:'

describe powershell(script_code) do
  its('stdout') { should include script_result }
end
