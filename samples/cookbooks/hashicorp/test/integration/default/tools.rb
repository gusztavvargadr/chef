describe command('vagrant --version') do
  its('stdout') { should include 'Vagrant 2.' }
end

describe command('packer --version') do
  its('stdout') { should include 'Packer v1.' }
end

describe command('terraform --version') do
  its('stdout') { should include 'Terraform v1.' }
end

# describe command('consul-template --version') do
#   its('stdout') { should include 'consul-template v0.' } unless os.windows?
# end

# describe command('consul --version') do
#   its('stdout') { should include 'Consul v2.' }
# end

# describe command('vault --version') do
#   its('stdout') { should include 'Vault v2.' }
# end

# describe command('nomad --version') do
#   its('stdout') { should include 'Nomad v2.' }
# end
