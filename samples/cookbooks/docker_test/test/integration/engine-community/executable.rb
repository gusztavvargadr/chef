executable_path = "#{ENV['ProgramFiles']}/Docker/Docker/Docker Desktop.exe"

describe file(executable_path) do
  it { should exist }
end
