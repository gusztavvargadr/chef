path = os.windows? ? 'C:\Windows\Temp\hello-world.txt' : '/var/tmp/hello-world.txt'

describe file(path) do
  it { should be_file }
  its('size') { should eq 13 }
  its('content') { should match(/\AHello, World!/) }
end
