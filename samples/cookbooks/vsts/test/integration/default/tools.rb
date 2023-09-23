describe directory('C:/Users/vagrant/opt/vsts-agent') do
  it { should exist } if os.windows?
end

describe directory('/home/vagrant/opt/vsts-agent') do
  it { should exist } unless os.windows?
end
