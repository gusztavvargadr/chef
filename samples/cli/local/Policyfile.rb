name 'cli'

run_list 'recipe[gusztavvargadr_windows::chocolatey_packages]'

default_source :supermarket
default_source :chef_repo, '../../cookbooks'

cookbook 'gusztavvargadr_windows'

default['gusztavvargadr_windows'] = {
  'chocolatey_packages' => {
    'chefdk' => {
      'version' => '3.1.0',
    },
  },
}
