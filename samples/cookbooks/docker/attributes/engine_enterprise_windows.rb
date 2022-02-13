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
  'chocolatey_packages' => {
    'docker-compose' => {
      'version' => '1.29.2',
    },
  },
}
