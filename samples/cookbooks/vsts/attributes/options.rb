default['gusztavvargadr_vsts']['options']['tools']['agent:latest'] = {
  'windows' => {
    'version' => '4.252.0',
    'arch' => 'x64',
    'config' => {
      'url' => '',
      'auth' => '',
      'token' => '',
      'pool' => '',
      'agent' => '',
      'env' => {},
    },
  },
  'ubuntu' => {
    'version' => '4.252.0',
    'arch' => 'x64',
    'config' => {
      'url' => '',
      'auth' => '',
      'token' => '',
      'pool' => '',
      'agent' => '',
      'env' => {},
    },
  },
}

default['gusztavvargadr_vsts']['options']['tools']['agent'] = default['gusztavvargadr_vsts']['options']['tools']['agent:latest']
