describe command('docker version -f "{{ .Server.Version }}"') do
  its('stdout') { should include '29.' }
end

describe command('docker version -f "{{ .Server.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' }
end

describe command('docker version -f "{{ .Client.Version }}"') do
  its('stdout') { should include '29.' }
end

describe command('docker version -f "{{ .Client.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' } unless os.windows?
end

describe command('docker compose version') do
  its('stdout') { should include 'Docker Compose version v5.' }
end
