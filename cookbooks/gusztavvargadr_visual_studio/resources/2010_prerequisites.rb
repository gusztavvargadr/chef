action :install do
  gusztavvargadr_windows_windows_updates '' do
    action :enable
  end

  gusztavvargadr_windows_windows_feature 'NetFx3' do
    action :enable
  end

  gusztavvargadr_windows_windows_updates '' do
    action :disable
  end

  gusztavvargadr_windows_windows_feature 'NetFx4-AdvSrvs' do
    action :enable
  end

  ['IIS-WebServer', 'IIS-ASPNET', 'IIS-ASPNET45'].each do |windows_feature|
    gusztavvargadr_windows_windows_feature windows_feature do
      action :enable
    end
  end
end
