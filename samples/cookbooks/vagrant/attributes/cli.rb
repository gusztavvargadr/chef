default['gusztavvargadr_vagrant']['cli'] = {
  'chocolatey_packages' => {
    'vagrant' => {
      'version' => '2.2.13',
      'install' => {
        'ignore-package-exit-codes' => '',
      },
      'reboot' => true,
    },
  },
}
