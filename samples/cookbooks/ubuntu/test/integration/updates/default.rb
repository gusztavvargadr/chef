describe command('apt autoremove -y') do
  its('stdout') { should include '0 upgraded' }
  its('stdout') { should include '0 newly installed' }
  its('stdout') { should include '0 to remove' }
end
