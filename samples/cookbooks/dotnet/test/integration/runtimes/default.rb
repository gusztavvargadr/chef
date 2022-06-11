describe command('dotnet --list-runtimes') do
  its('stdout') { should include '6.0.' }
  its('stdout') { should include '3.1.' }
end
