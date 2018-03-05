service_name = 'wuauserv'

describe service(service_name) do
  it { should be_running }
end
