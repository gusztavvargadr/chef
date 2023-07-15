describe command('docker image ls -a') do
  its('stdout') { should include 'hello-world' }
end
