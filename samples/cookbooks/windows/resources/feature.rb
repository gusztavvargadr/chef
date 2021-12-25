unified_mode true

property :options, Hash, default: {}

default_action :install

action :install do
  feature_list = powershell_out("Get-WindowsOptionalFeature -Online | Where { $_.FeatureName -match \"#{new_resource.name}\" } | Where { $_.State -ne \"Enabled\" }").stdout
  return if feature_list.strip.empty?

  script_name = "Install feature '#{new_resource.name}'"

  powershell_script script_name do
    code <<-EOH
      Get-WindowsOptionalFeature -Online | Where { $_.FeatureName -match "#{new_resource.name}" } | Where { $_.State -ne "Enabled" } | ForEach { Enable-WindowsOptionalFeature -Online -FeatureName $_.FeatureName -All -NoRestart }
    EOH
    action :run
  end
end
