describe command('docker version -f "{{ .Client.Version }}"') do
  its('stdout') { should include '20.10.' }
end
