default['gusztavvargadr_virtualbox']['options']['tools']['app:7.2'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.2.2',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.2',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:7.1'] = {
  'windows' => {
    'package' => 'virtualbox',
    'version' => '7.1.12',
  },
  'ubuntu' => {
    'package' => 'virtualbox-7.1',
  },
}

default['gusztavvargadr_virtualbox']['options']['tools']['app:latest'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:7.2']
default['gusztavvargadr_virtualbox']['options']['tools']['app'] = default['gusztavvargadr_virtualbox']['options']['tools']['app:latest']
