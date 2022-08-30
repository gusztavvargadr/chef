describe command('docker version -f "{{ .Client.Version }}"') do
  its('stdout') { should include '20.10.' }
end

describe command('docker version -f "{{ .Client.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' }
end
