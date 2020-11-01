provides :gusztavvargadr_vagrant_app, platform: 'windows'

property :version, String, required: true

default_action :install

action :install do
  chocolatey_packages_options = {
    'vagrant' => {
      'version' => new_resource.version,
      'install' => {
        'ignore-package-exit-codes' => '',
      },
      'reboot' => true,
    },
  }

  gusztavvargadr_windows_chocolatey_packages "Vagrant app #{new_resource.version}" do
    options chocolatey_packages_options
    action :install
  end
end
