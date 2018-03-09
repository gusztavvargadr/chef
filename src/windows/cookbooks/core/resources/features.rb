property :features_options, Hash, default: {}

default_action :install

action :install do
  features_options.each do |feature_name, feature_options|
    gusztavvargadr_windows_feature feature_name do
      feature_options feature_options ? feature_options : {}
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
    # not-if
  end
end
