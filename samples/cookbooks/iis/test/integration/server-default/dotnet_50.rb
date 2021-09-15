describe command('dotnet --list-runtimes') do
  its('stdout') { should include '5.0.10' }
end
