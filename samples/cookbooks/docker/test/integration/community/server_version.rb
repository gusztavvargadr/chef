describe command('docker version -f "{{ .Server.Version }}"') do
  its('stdout') { should include '20.10.' } unless os.windows?
end

describe command('docker version -f "{{ .Server.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' }
end
