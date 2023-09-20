vboxmanage = os.windows? ? "& 'C:/Program Files/Oracle/VirtualBox/VBoxManage.exe'" : 'vboxmanage'

describe command("#{vboxmanage} --version") do
  its('stdout') { should include '6.1.' }
end

describe command("#{vboxmanage} list extpacks") do
  its('stdout') { should include '6.1.' }
end
