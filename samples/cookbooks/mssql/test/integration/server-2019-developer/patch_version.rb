describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU14' }
  its('stdout') { should include '15.0.4188.2' }
end
