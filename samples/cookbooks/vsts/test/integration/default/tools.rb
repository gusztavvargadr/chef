if os.windows?
  describe directory("#{os_env('USERPROFILE')}.content}/opt/vsts-agent") do
    it { should exist }
  end
else
  describe directory("#{os_env('HOME').content}/opt/vsts-agent") do
    it { should exist }
  end
end
