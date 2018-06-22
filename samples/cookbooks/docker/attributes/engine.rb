default['gusztavvargadr_docker']['engine'] = {
  'edition' => 'community',
  'mode' => 'linux',
}

default['gusztavvargadr_docker']['engine']['windows']['community'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'native_packages' => {
    'Docker for Windows (Stable)' => {
      'source' => 'https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe',
      'install' => [
        'install',
        '--quiet',
      ],
      'executable' => 'C:/Program Files/Docker/Docker/DockerCli.exe',
    },
  },
}

default['gusztavvargadr_docker']['engine']['windows']['enterprise'] = {
  'features' => {
    'Containers' => {},
  },
  'native_packages' => {
  },
}
