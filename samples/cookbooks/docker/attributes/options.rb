default['gusztavvargadr_docker']['options']['tools']['engine:latest-community'] = {
  'windows' => {
    'features' => {
      'Containers' => {},
    },
    'powershell_source' => 'https://raw.githubusercontent.com/microsoft/Windows-Containers/93a4a835e0a359bb91b11fa30da99c1893f5efd3/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
    'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
    'users' => {},
  },
  'ubuntu' => {
    'users' => {},
  },
}

default['gusztavvargadr_docker']['options']['tools']['engine:latest'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest-community']
default['gusztavvargadr_docker']['options']['tools']['engine'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest']
