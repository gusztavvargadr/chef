tools = node['gusztavvargadr_hashicorp']['tools']
tools.each do |tool_name, tool_options|
  gusztavvargadr_hashicorp_tool tool_name do
    options tool_options
    action :install
  end
end

reboot 'gusztavvargadr_hashicorp::provision' do
  action :reboot_now
  only_if { reboot_pending? }
end
