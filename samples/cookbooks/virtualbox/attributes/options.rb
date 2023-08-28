default['gusztavvargadr_virtualbox']['options']['tools']['app:7.0'] = {
  'windows' => {
    'package' => 'virtualbox',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.0',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:6.1'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '6.1.46',
  },
  'ubuntu' => {
    'package' => 'virtualbox-6.1',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:latest'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:7.0']
default['gusztavvargadr_virtualbox']['options']['tools']['app'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:latest']
