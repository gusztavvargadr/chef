unified_mode true

property :options, Hash, default: {}

default_action :install

action :install do
  feature_list = powershell_out("Get-WindowsOptionalFeature -Online | Where { $_.FeatureName -match \"#{new_resource.name}\" } | Where { $_.State -ne \"Enabled\" }").stdout
  return if feature_list.strip.empty?

  ignore_reboot = node['gusztavvargadr_windows']['ignore_reboot']
  reboot = new_resource.options['reboot'] && !ignore_reboot

  script_name = "Install feature '#{new_resource.name}'"

  if reboot
    reboot 'Install' do
      action :nothing
      reason script_name
    end
  end

  powershell_script script_name do
    code <<-EOH
      Get-WindowsOptionalFeature -Online | Where { $_.FeatureName -match "#{new_resource.name}" } | Where { $_.State -ne "Enabled" } | ForEach { Enable-WindowsOptionalFeature -Online -FeatureName $_.FeatureName -All -NoRestart }
    EOH
    action :run
    notifies :request_reboot, 'reboot[Install]' if reboot
  end
end
