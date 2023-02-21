describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU19' }
  its('stdout') { should include '15.0.4298.1' }
end
