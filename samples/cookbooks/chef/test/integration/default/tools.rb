describe command('chef --version') do
  its('stdout') { should include 'Chef Workstation version: 23.' } if os.windows?
  its('stdout') { should include 'Chef Workstation version: 24.' } unless os.windows?
end
