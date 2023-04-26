describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU20' }
  its('stdout') { should include '15.0.4312.2' }
end
