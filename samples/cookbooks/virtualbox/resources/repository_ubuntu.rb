unified_mode true

provides :gusztavvargadr_virtualbox_repository, platform: 'ubuntu'

default_action :add

action :add do
  apt_repository_arch = shell_out('dpkg --print-architecture').stdout.strip
  apt_repository 'virtualbox' do
    uri 'https://download.virtualbox.org/virtualbox/debian'
    key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
    components ['contrib']
    arch apt_repository_arch
    action :add
  end
end
