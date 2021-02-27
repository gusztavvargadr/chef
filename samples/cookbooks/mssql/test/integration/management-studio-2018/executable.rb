executable_path = "#{ENV['ProgramFiles(x86)']}/Microsoft SQL Server Management Studio 18/Common7/IDE/Ssms.exe"

describe file(executable_path) do
  it { should exist }
end
