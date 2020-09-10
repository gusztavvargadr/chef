default['gusztavvargadr_docker']['engine_enterprise'] = {
  'features' => {
    'Containers' => {
      'reboot' => true,
    },
    'Hyper-V' => {
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
      'version' => '1.26.2',
    },
  },
}
