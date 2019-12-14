default['gusztavvargadr_vagrant']['cli'] = {
  'chocolatey_packages' => {
    'vagrant' => {
      'version' => '2.2.6',
      'install' => {
        'ignore-package-exit-codes' => '',
      },
      'reboot' => true,
    },
  },
}
