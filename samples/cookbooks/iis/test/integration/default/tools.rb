describe port(80) do
  it { should be_listening }
end

describe command('dotnet --list-runtimes') do
  its('stdout') { should include '8.0.' }
  its('stdout') { should include '6.0.' }
end
