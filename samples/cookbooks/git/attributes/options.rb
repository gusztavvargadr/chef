default['gusztavvargadr_git']['options']['tools']['app:latest'] = {
  'windows' => {
    'package' => 'git',
  },
  'ubuntu' => {
    'package' => 'git',
  },
}

default['gusztavvargadr_git']['options']['tools']['app'] = default['gusztavvargadr_git']['options']['tools']['app:latest']
