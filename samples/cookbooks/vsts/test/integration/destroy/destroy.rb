describe user('vsts') do
  it { should_not exist }
end

describe directory('/vsts') do
  it { should_not exist }
end
