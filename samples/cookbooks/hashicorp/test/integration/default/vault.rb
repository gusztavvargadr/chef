describe command('vault --version') do
  its('stdout') { should include 'Vault v1.' }
end
