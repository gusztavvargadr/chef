executable_path = "#{ENV['ProgramFiles(x86)']}/Microsoft SQL Server/140/Tools/Binn/ManagementStudio/Ssms.exe"

describe file(executable_path) do
  it { should exist }
end
