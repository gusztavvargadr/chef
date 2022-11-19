default['gusztavvargadr_docker']['engine']['community']['windows'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V-All' => {},
  },
  'powershell_source' => 'https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
  'native_packages' => {},
  'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
}
