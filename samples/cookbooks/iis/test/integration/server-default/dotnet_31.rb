describe command('dotnet --list-runtimes') do
  its('stdout') { should include '3.1.19' }
end
