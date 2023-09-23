describe directory('C:/Users/vagrant/opt/vsts-agent') do
  it { should_not exist } if os.windows?
end

describe directory('/home/vagrant/opt/vsts-agent') do
  it { should_not exist } unless os.windows?
end
