describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU12' }
  its('stdout') { should include '15.0.4153.1' }
end
