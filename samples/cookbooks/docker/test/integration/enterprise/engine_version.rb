describe command('docker version') do
  its('stdout') { should include 'Server:' }
end
