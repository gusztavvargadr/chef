describe command('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU17' }
  its('stdout') { should include '15.0.4249.2' }
end
