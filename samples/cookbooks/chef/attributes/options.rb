default['gusztavvargadr_chef']['options']['tools']['workstation:latest'] = {
  'windows' => {
    'package' => 'chef-workstation',
  },
  'ubuntu' => {
    'package' => 'chef-workstation',
  },
}

default['gusztavvargadr_chef']['options']['tools']['workstation'] = default['gusztavvargadr_chef']['options']['tools']['workstation:latest']
