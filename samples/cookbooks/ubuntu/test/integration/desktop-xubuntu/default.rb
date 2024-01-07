describe command('apt list --installed') do
  its('stdout') { should include 'xubuntu-desktop' }
  its('stdout') { should include 'firefox' }
end
