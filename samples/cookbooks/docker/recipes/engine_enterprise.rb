gusztavvargadr_docker_engine 'enterprise' do
  action :prepare
end

gusztavvargadr_docker_engine 'enterprise' do
  action :install
  not_if { reboot_pending? }
end

#     echo { "hosts": ["tcp://0.0.0.0:2375", "npipe://"] } > C:\ProgramData\Docker\config\daemon.json
#     net stop docker
#     net start docker
