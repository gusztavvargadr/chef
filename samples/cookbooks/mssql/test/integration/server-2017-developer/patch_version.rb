describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU26' }
  its('stdout') { should include '14.0.3411.3' }
end
