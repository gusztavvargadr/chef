default['gusztavvargadr_hashicorp']['app_options'] = {
  'consul' => {
    'name' => 'consul',
    'version' => 'latest',
  },
  'vault' => {
    'name' => 'vault',
    'version' => 'latest',
  },
  'consul-template' => {
    'name' => 'consul-template',
    'version' => 'latest',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['vagrant:latest'] = {
  'windows' => {
    'package' => 'vagrant',
  },
  'ubuntu' => {
    'package' => 'vagrant',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['vagrant'] = default['gusztavvargadr_hashicorp']['options']['tools']['vagrant:latest']

default['gusztavvargadr_hashicorp']['options']['tools']['packer:latest'] = {
  'windows' => {
    'package' => 'packer',
  },
  'ubuntu' => {
    'package' => 'packer',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['packer'] = default['gusztavvargadr_hashicorp']['options']['tools']['packer:latest']

default['gusztavvargadr_hashicorp']['options']['tools']['terraform:latest'] = {
  'windows' => {
    'package' => 'terraform',
  },
  'ubuntu' => {
    'package' => 'terraform',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['terraform'] = default['gusztavvargadr_hashicorp']['options']['tools']['terraform:latest']

default['gusztavvargadr_hashicorp']['options']['tools']['consul:latest'] = {
  'windows' => {
    'package' => 'consul',
  },
  'ubuntu' => {
    'package' => 'consul',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['consul'] = default['gusztavvargadr_hashicorp']['options']['tools']['consul:latest']

default['gusztavvargadr_hashicorp']['options']['tools']['vault:latest'] = {
  'windows' => {
    'package' => 'vault',
  },
  'ubuntu' => {
    'package' => 'vault',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['vault'] = default['gusztavvargadr_hashicorp']['options']['tools']['vault:latest']

default['gusztavvargadr_hashicorp']['options']['tools']['consul-template:latest'] = {
  'windows' => {
    'package' => 'consul-template',
  },
  'ubuntu' => {
    'package' => 'consul-template',
  },
}

default['gusztavvargadr_hashicorp']['options']['tools']['consul-template'] = default['gusztavvargadr_hashicorp']['options']['tools']['consul-template:latest']
