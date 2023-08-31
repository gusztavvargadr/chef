default['gusztavvargadr_docker']['options']['tools']['engine:latest-community'] = {
  'windows' => {
    'features' => {
      'Containers' => {},
    },
    'powershell_source' => 'https://raw.githubusercontent.com/microsoft/Windows-Containers/c344adb529e8fed66e9d16aceb17943b50578b1e/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
    'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
    'users' => {},
  },
  'ubuntu' => {
    'users' => {},
  },
}

default['gusztavvargadr_docker']['options']['tools']['engine:latest'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest-community']
default['gusztavvargadr_docker']['options']['tools']['engine'] = default['gusztavvargadr_docker']['options']['tools']['engine:latest']
