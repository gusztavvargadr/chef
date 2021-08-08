describe powershell('$env:TEST_NAME') do
  its('stdout') { should include 'Test Value' }
end
