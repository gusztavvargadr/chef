service_name = 'wuauserv'

describe service(service_name) do
  it { should_not be_running }
end
