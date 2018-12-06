property :name, String, name_property: true
property :options, Hash, default: {}

default_action :install

action :install do
  gusztavvargadr_windows_powershell_script_elevated "Install feature '#{new_resource.name}'" do
    code <<-EOH
      Get-WindowsOptionalFeature -Online | Where { $_.FeatureName -match "#{new_resource.name}" } | Where { $_.State -ne "Enabled" } | ForEach { Enable-WindowsOptionalFeature -Online -FeatureName $_.FeatureName -All -NoRestart }
    EOH
    action :run
    # not-if
  end
end
