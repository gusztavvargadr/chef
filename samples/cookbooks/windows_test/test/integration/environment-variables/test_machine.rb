value_script_code = '$env:TEST_MACHINE'
value_script_result = 'Test Machine'

describe powershell(value_script_code) do
  its('stdout') { should include value_script_result }
end
