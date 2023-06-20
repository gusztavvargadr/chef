describe command('docker version -f "{{ .Client.Version }}"') do
  its('stdout') { should include '24.' }
end
