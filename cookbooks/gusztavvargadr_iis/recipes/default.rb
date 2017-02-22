gusztavvargadr_windows_windows_updates '' do
  action [:enable, :start]
end

['NetFx3', 'NetFx4-AdvSrvs'].each do |windows_feature|
  gusztavvargadr_windows_windows_feature windows_feature do
    action :enable
  end
end

['IIS-WebServer', 'IIS-ASPNET', 'IIS-ASPNET45'].each do |windows_feature|
  gusztavvargadr_windows_windows_feature windows_feature do
    action :enable
  end
end

directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_iis/dotnet"

directory directory_path do
  recursive true
  action :create
end

installer_file_name = 'DotNetCore.1.0.3_1.1.0-WindowsHosting.exe'
installer_file_path = "#{directory_path}/#{installer_file_name}"
installer_file_source_url = "https://download.microsoft.com/download/7/E/4/7E407C90-0154-42BA-8B9E-766C9CB94C3C/#{installer_file_name}"

remote_file installer_file_path do
  source installer_file_source_url
  action :create
end

gusztavvargadr_windows_powershell_script_elevated 'Install .NET Core Windows Server Hosting' do
  code <<-EOH
    Start-Process "#{installer_file_path}" "/install /quiet /norestart" -Wait
  EOH
  action :run
end

directory directory_path do
  action :delete
end

gusztavvargadr_windows_windows_updates '' do
  action :disable
end
