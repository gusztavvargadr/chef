executable_path = "#{ENV['ProgramFiles(x86)']}/Microsoft Visual Studio/2017/Community/Common7/IDE/devenv.exe"

describe file(executable_path) do
  it { should exist }
end
