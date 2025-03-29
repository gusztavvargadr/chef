default['gusztavvargadr_virtualbox']['options']['tools']['app:7.1'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.1.6',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.1',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:7.0'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.0.24',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.0',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:latest'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:7.1']
default['gusztavvargadr_virtualbox']['options']['tools']['app'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:latest']
