directory_path = "#{Chef::Config[:file_cache_path]}/packer_visual_studio/2015_core"

directory directory_path do
  recursive true
  action :create
end

installer_file_name = 'DotNetCore.1.0.1-VS2015Tools.Preview2.0.3.exe'
installer_file_path = "#{directory_path}/#{installer_file_name}"
installer_file_source_url = "https://download.microsoft.com/download/F/6/E/F6ECBBCC-B02F-424E-8E03-D47E9FA631B7/#{installer_file_name}"

remote_file installer_file_path do
  source installer_file_source_url
  action :create
end

gusztavvargadr_windows_powershell_script_elevated 'Install .NET Core Tools' do
  code <<-EOH
    Start-Process "#{installer_file_path}" "/install /quiet /norestart" -Wait
  EOH
  action :run
end

directory directory_path do
  action :delete
end
