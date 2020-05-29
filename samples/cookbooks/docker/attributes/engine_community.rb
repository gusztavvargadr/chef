default['gusztavvargadr_docker']['engine_community'] = {
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
  'native_packages' => {},
  'chocolatey_packages' => {
    'docker-desktop' => {
      'version' => '2.3.0.3',
      'reboot' => true,
    },
    'docker-machine' => {
      'version' => '0.16.2',
    },
  },
}
