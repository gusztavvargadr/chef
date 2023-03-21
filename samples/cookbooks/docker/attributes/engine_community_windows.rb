default['gusztavvargadr_docker']['engine']['community']['windows'] = {
  'features' => {
    'Containers$' => {},
    'Microsoft-Hyper-V$' => {},
  },
  'powershell_source' => 'https://github.com/microsoft/Windows-Containers/blob/82e0a752521b4e3899fc3fa80bc2130c92ade891/helpful_tools/Install-DockerCE/install-docker-ce.ps1',
  'native_packages' => {},
  'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
}
