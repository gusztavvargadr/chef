describe command('vagrant box list') do
  its('stdout') { should include 'gusztavvargadr/ubuntu-server' }
end
