describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU15' }
  its('stdout') { should include '15.0.4198.2' }
end
