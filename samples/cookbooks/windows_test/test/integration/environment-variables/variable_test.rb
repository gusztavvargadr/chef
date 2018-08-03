value_script_code = '$env:VARIABLE_TEST'
value_script_result = 'test'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
