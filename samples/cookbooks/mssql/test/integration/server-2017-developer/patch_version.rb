describe powershell('sqlcmd -Q "SELECT @@VERSION"') do
  its('stdout') { should include 'CU25' }
  its('stdout') { should include '14.0.3401.7' }
end
