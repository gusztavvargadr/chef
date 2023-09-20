describe command('vagrant --version') do
  its('stdout') { should include 'Vagrant 2.' }
end

describe command('packer --version') do
  its('stdout') { should include '1.' }
end

describe command('terraform --version') do
  its('stdout') { should include 'Terraform v1.' }
end

describe command('consul --version') do
  its('stdout') { should include 'Consul v1.' }
end

describe command('vault --version') do
  its('stdout') { should include 'Vault v1.' }
end

describe command('consul-template --version') do
  its('stdout') { should include 'consul-template v0.' } unless os.windows?
end
