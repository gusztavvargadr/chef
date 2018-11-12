default['gusztavvargadr_docker']['engine_community'] = {
  'features' => {
    'Containers' => {},
    'Hyper-V' => {},
  },
  'powershell_modules' => {},
  'chocolatey_packages' => {
    'docker-for-windows' => {
      'elevated' => true,
    },
  },
  'powershell_packages' => {},
}
