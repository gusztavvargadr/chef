describe command('dotnet --list-sdks') do
  its('stdout') { should include '9.0.' }
  its('stdout') { should include '8.0.' }
end
