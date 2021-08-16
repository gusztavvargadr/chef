describe command('vagrant --version') do
  its('stdout') { should include 'Vagrant 2.2.18' }
end
