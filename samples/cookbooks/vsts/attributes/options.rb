default['gusztavvargadr_vsts']['options']['tools']['agent:latest'] = {
  'windows' => {
    'version' => '3.225.0',
    'arch' => 'x64',
    'user' => 'vsts',
    'password' => 'Password42-',
    'groups' => {},
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
    'version' => '3.225.0',
    'arch' => 'x64',
    'user' => 'vsts',
    'groups' => {},
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
