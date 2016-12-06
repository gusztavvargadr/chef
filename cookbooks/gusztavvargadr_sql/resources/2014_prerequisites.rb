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
end
