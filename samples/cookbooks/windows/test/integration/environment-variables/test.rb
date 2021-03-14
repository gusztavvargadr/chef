value_script_code = '$env:TEST_NAME'
value_script_result = 'Test Value'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
