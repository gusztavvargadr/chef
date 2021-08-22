default['gusztavvargadr_docker']['engine']['enterprise']['windows_server'] = {
  'features' => {
    'Containers' => {
      'reboot' => true,
    },
    'Hyper-V-All' => {
      'reboot' => true,
    },
  },
  'powershell_modules' => {
    'DockerMsftProvider' => {},
  },
  'powershell_packages' => {
    'Docker' => {
      'provider' => 'DockerMsftProvider',
    },
  },
  'native_packages' => {},
  'chocolatey_packages' => {
    'docker-compose' => {
      'version' => '1.29.2',
    },
  },
}
