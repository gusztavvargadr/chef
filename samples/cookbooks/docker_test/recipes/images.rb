include_recipe 'gusztavvargadr_docker::engine_enterprise'

reboot 'Test' do
  action :nothing
end

directory 'C:/tmp/chef/reboot/test/install' do
  recursive true
  action :create
  notifies :reboot_now, 'reboot[Test]', :immediately
end

include_recipe 'gusztavvargadr_docker::images'
