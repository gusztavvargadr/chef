describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'Microsoft SQL Server 2019' }
end

describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU24' }
  its('stdout') { should include '15.0.4345.5' }
end
