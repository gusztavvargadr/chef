default['gusztavvargadr_docker']['engine_community'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'powershell_modules' => {},
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
  'powershell_packages' => {},
}
