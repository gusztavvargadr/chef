provides :gusztavvargadr_vagrant_plugin

property :version, String, required: true

default_action :install

action :install do
  powershell_script "Vagrant plugin #{new_resource.name} #{new_resource.version}" do
    code <<-EOH
      vagrant plugin install #{new_resource.name} --plugin-version #{new_resource.version}
    EOH
    not_if "(vagrant plugin list | Out-String) -match '#{new_resource.name}'"
    action :run
  end
end
