executable_file_path = 'C:/Program Files/Docker/Docker/Docker Desktop.exe'

describe file(executable_file_path) do
  it { should exist }
end
