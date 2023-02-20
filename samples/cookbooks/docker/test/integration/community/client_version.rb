describe command('docker version -f "{{ .Client.Version }}"') do
  its('stdout') { should include '23.' } unless os.windows?
end

describe command('docker version -f "{{ .Client.Platform.Name }}"') do
  its('stdout') { should include 'Docker Engine - Community' } unless os.windows?
end
