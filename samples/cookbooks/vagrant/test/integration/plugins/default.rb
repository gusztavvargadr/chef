describe command('vagrant plugin list') do
  its('stdout') { should include 'vagrant-sshfs' }
end
