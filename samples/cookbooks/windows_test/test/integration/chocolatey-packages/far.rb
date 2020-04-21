version_script_code = 'far -h'
version_script_result = 'Far Manager, version'

describe powershell(version_script_code) do
  its('stdout') { should include version_script_result }
end
