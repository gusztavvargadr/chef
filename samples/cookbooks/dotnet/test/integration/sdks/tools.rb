describe command('dotnet --list-sdks') do
  its('stdout') { should include '8.0.' }
  its('stdout') { should include '6.0.' }
end
