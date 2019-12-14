default_action :install

action :install do
  gusztavvargadr_windows_chocolatey_packages '' do
    options node['gusztavvargadr_vagrant']['cli']['chocolatey_packages']
    action :install
  end
end
