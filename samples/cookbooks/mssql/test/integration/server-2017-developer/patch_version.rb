describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU28' }
  its('stdout') { should include '14.0.3430.2' }
end
