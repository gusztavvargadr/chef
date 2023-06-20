describe command('docker version -f "{{ .Server.Version }}"') do
  its('stdout') { should include '24.' }
end

describe command('docker version -f "{{ .Server.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' }
end
