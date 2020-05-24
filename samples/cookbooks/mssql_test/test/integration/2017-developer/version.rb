version_script_code = 'sqlcmd -Q "SELECT @@VERSION"'
version_script_result = 'Microsoft SQL Server 2017'

describe powershell(version_script_code) do
  its('stdout') { should include version_script_result }
end
