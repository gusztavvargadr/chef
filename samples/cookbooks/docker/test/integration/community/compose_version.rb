describe command('docker compose version') do
  its('stdout') { should include 'Docker Compose version v2.' }
end

describe command('docker-compose --version') do
  its('stdout') { should include 'Docker Compose version v2.' }
end
