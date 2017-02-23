action :install do
  gusztavvargadr_windows_windows_updates '' do
    action [:enable, :start]
  end

  ['NetFx3'].each do |windows_feature|
    gusztavvargadr_windows_windows_feature windows_feature do
      action :enable
    end
  end

  gusztavvargadr_windows_windows_updates '' do
    action :disable
  end
end
