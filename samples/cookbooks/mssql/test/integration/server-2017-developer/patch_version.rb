describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU29' }
  its('stdout') { should include '14.0.3451.2' }
end
