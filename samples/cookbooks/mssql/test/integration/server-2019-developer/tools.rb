describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'Microsoft SQL Server 2019' }
end

describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU26' }
  its('stdout') { should include '15.0.4365.2' }
end
