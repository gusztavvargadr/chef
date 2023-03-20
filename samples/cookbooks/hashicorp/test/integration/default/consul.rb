describe command('consul --version') do
  its('stdout') { should include 'Consul v1.' }
end
