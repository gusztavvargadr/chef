describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU31' }
  its('stdout') { should include '14.0.3456.2' }
end
