default['gusztavvargadr_vsts']['options']['tools']['agent:latest'] = {
  'windows' => {
    'version' => '3.240.1',
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
    'version' => '3.240.1',
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
