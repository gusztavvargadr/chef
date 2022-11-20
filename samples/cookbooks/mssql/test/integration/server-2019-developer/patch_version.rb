describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU18' }
  its('stdout') { should include '15.0.4261.1' }
end
