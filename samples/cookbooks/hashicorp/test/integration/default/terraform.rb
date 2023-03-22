describe command('terraform --version') do
  its('stdout') { should include 'Terraform v1.' }
end
