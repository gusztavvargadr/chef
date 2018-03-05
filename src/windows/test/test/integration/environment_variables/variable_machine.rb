value_script_code = '$env:VARIABLE_MACHINE'
value_script_result = 'machine'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
