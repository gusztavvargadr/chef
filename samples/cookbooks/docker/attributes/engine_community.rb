default['gusztavvargadr_docker']['engine_community'] = {
  'features' => {
    'Containers' => {
      'reboot' => 'true',
    },
    'Hyper-V' => {
      'reboot' => 'true',
    },
  },
  'powershell_modules' => {},
  'powershell_packages' => {},
  'chocolatey_packages' => {
    'docker-desktop' => {
      'version' => '2.2.0.4',
      'reboot' => 'true',
    },
  },
}
