property :options, Hash, default: {}

default_action :install

action :install do
  return if new_resource.options.nil?

  new_resource.options.each do |name, options|
    gusztavvargadr_windows_feature name do
      options options
      action :install
    end
  end
end

action :cleanup do
  gusztavvargadr_windows_powershell_script_elevated 'Clean up features' do
    code <<-EOH
      Get-WindowsOptionalFeature -Online | Where { $_.State -ne "Enabled" } | ForEach { Disable-WindowsOptionalFeature -Online -FeatureName $_.FeatureName -NoRestart -Remove }
    EOH
    action :run
    # not-if?
  end
end
