unified_mode true

provides :gusztavvargadr_windows_update

property :options, Hash, default: {}

default_action :install

action :initialize do
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
  powershell_script 'Install Updates' do
    code <<-EOH
      Get-WUInstall -MicrosoftUpdate -AcceptAll -Install -IgnoreUserInput -IgnoreReboot
    EOH
    action :run
    not_if { powershell_out('(Get-WUInstall -MicrosoftUpdate).Count').stdout.strip == '0' }
  end

  reboot 'gusztavvargadr_windows_updates_install' do
    action :reboot_now
    only_if { reboot_pending? }
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

  reboot 'gusztavvargadr_windows_updates_cleanup' do
    action :reboot_now
    only_if { reboot_pending? }
  end
end
