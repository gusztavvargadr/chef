default['gusztavvargadr_docker']['options']['tools']['engine:latest-community'] = {
  'windows' => {
    'features' => {
      'Containers' => {},
    },
    'powershell_source' => 'https://raw.githubusercontent.com/microsoft/Windows-Containers/77de763e1c27a466f9ce62e4f74e3039b8f97322/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
    'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
    'users' => {},
  },
  'ubuntu' => {
    'users' => {},
  },
}

default['gusztavvargadr_docker']['options']['tools']['engine:latest'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest-community']
default['gusztavvargadr_docker']['options']['tools']['engine'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest']
