describe command('dotnet --list-runtimes') do
  its('stdout') { should include '3.1.20' }
end
