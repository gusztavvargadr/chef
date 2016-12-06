features = node['gusztavvargadr_windows'].nil? ? nil : node['gusztavvargadr_windows']['features']
unless features.nil?
  features.each do |feature_name|
    gusztavvargadr_windows_windows_feature feature_name do
      action :enable
    end
  end
end
