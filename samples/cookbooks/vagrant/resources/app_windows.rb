provides :gusztavvargadr_vagrant_app, platform: 'windows'

property :version, String, default: ''

default_action :install

action :install do
  return if new_resource.version.to_s.empty?

  chocolatey_packages_options = {
    'vagrant' => {
      'version' => new_resource.version,
      'install' => {
        'ignore-package-exit-codes' => '',
      },
      'reboot' => true,
    },
  }

  gusztavvargadr_windows_chocolatey_packages '' do
    options chocolatey_packages_options
    action :install
  end
end
