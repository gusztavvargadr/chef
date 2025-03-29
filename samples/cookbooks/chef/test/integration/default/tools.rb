describe command('chef --version') do
  its('stdout') { should include 'Chef Workstation version: 25.' }
end
