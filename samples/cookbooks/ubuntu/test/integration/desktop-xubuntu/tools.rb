describe command('apt list --installed') do
  its('stdout') { should include 'xubuntu-desktop' }
end
