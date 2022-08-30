default['gusztavvargadr_docker']['engine']['enterprise']['windows'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V-All' => {},
  },
  'powershell_modules' => {
    'DockerMsftProvider' => {},
  },
  'powershell_packages' => {
    'Docker' => {
      'version' => '20.10.9',
      'provider' => 'DockerMsftProvider',
    },
  },
  'native_packages' => {},
  'compose_source' => 'https://github.com/docker/compose/releases/latest/download/docker-compose-windows-x86_64.exe',
}

#  to ~/.docker/cli-plugins
