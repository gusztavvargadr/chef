default['gusztavvargadr_docker']['engine']['community']['windows_server'] = {
  'features' => {
    'Containers' => {
      'reboot' => true,
    },
    'Hyper-V' => {
      'reboot' => true,
    },
  },
  'powershell_modules' => {},
  'powershell_packages' => {},
  'native_packages' => {
    'Docker Desktop' => {
      'source' => 'https://download.docker.com/win/stable/43884/Docker%20Desktop%20Installer.exe',
      'install' => [
        'install',
        '--quiet',
      ],
      'executable' => 'C:/Program Files/Docker/Docker/Docker Desktop.exe',
      'reboot' => true,
    },
  },
  'chocolatey_packages' => {
    'docker-compose' => {
      'version' => '1.29.1',
    },
  },
}
