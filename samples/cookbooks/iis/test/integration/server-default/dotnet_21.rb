describe command('dotnet --list-runtimes') do
  its('stdout') { should include '2.1.29' }
end
