describe command('git --version') do
  its('stdout') { should include 'git version 2.' }
end
