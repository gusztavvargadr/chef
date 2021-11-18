describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU27' }
  its('stdout') { should include '14.0.3421.10' }
end
