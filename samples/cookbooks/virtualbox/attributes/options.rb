default['gusztavvargadr_virtualbox']['options']['tools']['app:7.1'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.1.2',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.1',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:7.0'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.0.20',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.0',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:latest'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:7.1']
default['gusztavvargadr_virtualbox']['options']['tools']['app'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:latest']
