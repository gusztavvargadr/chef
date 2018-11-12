default['gusztavvargadr_docker']['engine_enterprise'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'powershell_modules' => {
    'DockerMsftProvider' => {},
  },
  'chocolatey_packages' => {},
  'powershell_packages' => {
    'Docker' => {
      'provider' => 'DockerMsftProvider',
    },
  },
}
