property :msu_source, String, name_property: true

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
  if new_resource.msu_source.to_s.empty?
    powershell_script 'Install Updates' do
      code <<-EOH
        Install-WindowsUpdate -AcceptAll -IgnoreReboot
      EOH
      timeout 7_200
      action :run
    end
  else
    directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_windows/updates"
    directory directory_path do
      recursive true
      action :create
    end

    msu_file_path = "#{directory_path}/msu.msu"
    remote_file msu_file_path do
      source new_resource.msu_source
      action :create
    end

    powershell_script 'Install Updates' do
      code <<-EOH
        Start-Process "wusa.exe" "#{msu_file_path} /quiet /norestart" -Wait
      EOH
      action :run
    end
  end
end

action :cleanup do
  powershell_script 'Clean up Updates' do
    code <<-EOH
      DISM.exe /Online /Cleanup-Image /AnalyzeComponentStore
      DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    EOH
    timeout 7_200
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
