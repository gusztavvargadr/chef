executable_path = "#{ENV['ProgramFiles']}/ConEmu/ConEmu/ConEmuC.exe"

describe file(executable_path) do
  it { should exist }
end
