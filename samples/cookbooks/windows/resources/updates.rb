unified_mode true

default_action :install

action :enable do
  windows_service 'wuauserv' do
    action :configure_startup
    startup_type :manual
  end
end

action :start do
  windows_service 'wuauserv' do
    action :start
  end
end

action :configure do
  windows_update_settings '' do
    disable_automatic_updates true
    action :set
  end

  registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config' do
    values [{
      name: 'DODownloadMode',
      type: :dword,
      data: 0,
    }]
    recursive true
    action :create
  end

  registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\WindowsStore' do
    values [{
      name: 'AutoDownload',
      type: :dword,
      data: 2,
    }]
    recursive true
    action :create
  end

  powershell_script 'Install PSWindowsUpdate' do
    code <<-EOH
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

      Install-PackageProvider -Name Nuget -Force

      Install-Module PSWindowsUpdate -Force
    EOH
    action :run
    only_if { powershell_out('(Get-Module -ListAvailable | Where { $_.Name -eq "PSWindowsUpdate" }).Count').stdout.strip == '0' }
  end

  powershell_script 'Disable Reserved Storage State' do
    code <<-EOH
      DISM.exe /Online /Set-ReservedStorageState /State:Disabled
    EOH
    action :run
    only_if { powershell_out('DISM.exe /Online /?').stdout.include?('/Set-ReservedStorageState') }
    not_if { powershell_out('(Get-WUInstall -MicrosoftUpdate).Count').stdout.strip == '0' }
  end
end

action :install do
  reboot 'windows-update-install' do
    action :nothing
  end

  powershell_script 'Install Updates' do
    code <<-EOH
      Get-WUInstall -MicrosoftUpdate -AcceptAll -Install -IgnoreUserInput -IgnoreReboot
    EOH
    action :run
    not_if { powershell_out('(Get-WUInstall -MicrosoftUpdate).Count').stdout.strip == '0' }
    notifies :request_reboot, 'reboot[windows-update-install]'
  end
end

action :cleanup do
  powershell_script 'Clean up Updates' do
    code <<-EOH
      DISM.exe /Online /Cleanup-Image /AnalyzeComponentStore
      DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    EOH
    action :run
  end
end

action :stop do
  windows_service 'wuauserv' do
    action :stop
  end
end

action :disable do
  windows_service 'wuauserv' do
    action :configure_startup
    startup_type :disabled
  end
end
