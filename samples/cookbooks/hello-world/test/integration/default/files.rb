path = os.windows? ? 'C:\Windows\Temp\hello-world.txt' : '/var/tmp/hello-world.txt'

describe file(path) do
  it { should be_file }
  its('content') { should eq 'Hello, World!' }
end
