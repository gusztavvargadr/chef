unified_mode true

provides :gusztavvargadr_windows_update, platform: 'windows'

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
    code <<~EOH
      [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

      Install-PackageProvider -Name Nuget -Force

      Install-Module PSWindowsUpdate -Force
    EOH
    action :run
    only_if { powershell_out('(Get-Module -ListAvailable | Where { $_.Name -eq "PSWindowsUpdate" }).Count').stdout.strip == '0' }
  end

  powershell_script 'Disable Reserved Storage State' do
    code <<~EOH
      DISM.exe /Online /Set-ReservedStorageState /State:Disabled
    EOH
    action :run
    only_if { powershell_out('DISM.exe /Online /?').stdout.include?('/Set-ReservedStorageState') }
    not_if { powershell_out('(Get-WUInstall -MicrosoftUpdate).Count').stdout.strip == '0' }
  end
end

action :install do
  updates_installed = false
  updates_installed_path = "#{Chef::Config[:file_cache_path]}/windows-updates-installed.txt"

  (1..1).each do |attempt|
    updates_available = powershell_out('(Get-WUInstall -MicrosoftUpdate).Count').stdout.strip.to_i

    log "Windows Update scan found #{updates_available} available update(s) (attempt #{attempt})"
    break if updates_available.zero?

    ::File.delete(updates_installed_path) if ::File.exist?(updates_installed_path)

    powershell_script "Install Updates (attempt #{attempt})" do
      code <<~EOH
        $updates = [System.Collections.ArrayList]::new()

        Get-WUInstall -MicrosoftUpdate -AcceptAll -Install -IgnoreUserInput -IgnoreReboot -Verbose | ForEach-Object {
          [void] $updates.Add($_)
          Write-Output $_
        }

        $updatesInstalled = @($updates | Where-Object { $_.Result -eq 'Installed' }).Count
        Write-Output "Windows Update installed $updatesInstalled update(s)"
        Set-Content -LiteralPath '#{updates_installed_path}' -Value $updatesInstalled -NoNewline
      EOH
      live_stream true
      action :run
    end

    updates_installed_count = ::File.read(updates_installed_path).strip.to_i
    updates_installed ||= updates_installed_count.positive?
    break if updates_installed_count.zero? || reboot_pending?
  end

  ::File.delete(updates_installed_path) if ::File.exist?(updates_installed_path)
  node.run_state['gusztavvargadr_windows_updates_installed'] = updates_installed
end

action :cleanup do
  powershell_script 'Clean up Updates' do
    code <<~EOH
      DISM.exe /Online /Cleanup-Image /AnalyzeComponentStore
      DISM.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
    EOH
    action :run
  end
end
