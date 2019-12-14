value_script_code = '$env:TEST_USER'
value_script_result = 'Test User'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
