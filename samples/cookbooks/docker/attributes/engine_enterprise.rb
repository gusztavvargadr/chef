default['gusztavvargadr_docker']['engine_enterprise'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'powershell_modules' => {
    'DockerMsftProvider' => {},
  },
  'powershell_packages' => {
    'Docker' => {
      'provider' => 'DockerMsftProvider',
    },
  },
  'chocolatey_packages' => {
    'docker-compose' => {},
    'docker-machine' => {},
  },
}
