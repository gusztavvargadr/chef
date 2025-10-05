vboxmanage = os.windows? ? "& 'C:/Program Files/Oracle/VirtualBox/VBoxManage.exe'" : 'vboxmanage'

describe command("#{vboxmanage} --version") do
  its('stdout') { should include '7.2.' }
end

describe command("#{vboxmanage} list extpacks") do
  its('stdout') { should include '7.2.' }
end
