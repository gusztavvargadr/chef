default['gusztavvargadr_docker']['engine_enterprise'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'powershell_modules' => {
    'DockerMsftProvider' => {},
  },
  'native_packages' => {},
  'powershell_packages' => {
    'Docker' => {
      'provider' => 'DockerMsftProvider',
    },
  },
}
