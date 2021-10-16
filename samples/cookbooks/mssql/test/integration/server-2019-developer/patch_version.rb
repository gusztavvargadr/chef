describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU13' }
  its('stdout') { should include '15.0.4178.1' }
end
