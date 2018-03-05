value_script_code = '$env:VARIABLE_USER'
value_script_result = 'user'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
