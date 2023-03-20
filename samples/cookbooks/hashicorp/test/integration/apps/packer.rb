describe command('packer --version') do
  its('stdout') { should include '1.' }
end
