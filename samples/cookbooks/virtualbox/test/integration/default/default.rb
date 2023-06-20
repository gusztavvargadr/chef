if os.windows?
  describe file('C:/Program Files/Oracle/VirtualBox/VBoxManage.exe') do
    it { should exist }
  end
else
  describe command('vboxmanage --version') do
    its('stdout') { should include '6.1.' }
  end
end
