describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU21' }
  its('stdout') { should include '15.0.4316.3' }
end
