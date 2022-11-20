describe command('dotnet --list-sdks') do
  its('stdout') { should include '7.0.' }
  its('stdout') { should include '6.0.' }
  its('stdout') { should include '3.1.' }
end
