default['gusztavvargadr_chef']['options']['tools']['workstation:latest'] = {
  'windows' => {
    'project' => 'chef-workstation',
  },
  'ubuntu' => {
    'project' => 'chef-workstation',
  },
}

default['gusztavvargadr_chef']['options']['tools']['workstation'] = default['gusztavvargadr_chef']['options']['tools']['workstation:latest']
