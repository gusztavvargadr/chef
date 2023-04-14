describe command('consul-template --version') do
  its('stdout') { should include 'consul-template v0.' } unless os.windows?
end
