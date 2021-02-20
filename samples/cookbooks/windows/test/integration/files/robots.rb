target_file_path = 'C:/tmp/robots.txt'

describe file(target_file_path) do
  it { should exist }
end
