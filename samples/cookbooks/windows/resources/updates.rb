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
  powershell_script 'Configure Updates' do
    code <<-EOH
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

      Install-PackageProvider -Name Nuget -Force
      Install-Module PSWindowsUpdate -Force -Confirm:$false

      reg add 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config' /v DODownloadMode /t REG_DWORD /d 0 /f
    EOH
  end
end

action :install do
  powershell_script 'Install Updates' do
    code <<-EOH
      Get-WUInstall -MicrosoftUpdate -AcceptAll -Install -IgnoreUserInput -IgnoreReboot
    EOH
    action :run
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
