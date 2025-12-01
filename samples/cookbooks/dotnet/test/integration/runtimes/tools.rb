describe command('dotnet --list-runtimes') do
  # its('stdout') { should include '10.0.' }
  its('stdout') { should include '9.0.' }
  its('stdout') { should include '8.0.' }
end
