describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU22' }
  its('stdout') { should include '15.0.4322.2' }
end
