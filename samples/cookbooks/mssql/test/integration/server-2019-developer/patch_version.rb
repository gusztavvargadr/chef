describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU16' }
  its('stdout') { should include '15.0.4223.1' }
end
