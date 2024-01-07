describe command('apt list --installed') do
  its('stdout') { should include 'ubuntu-desktop' }
  its('stdout') { should include 'firefox' }
end
