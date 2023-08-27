default['gusztavvargadr_dotnet']['options']['tools']['runtime:7.0'] = {
  'windows' => {
    'package' => 'dotnet-7.0-runtime',
  },
  'ubuntu' => {
    'package' => 'dotnet-runtime-7.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['runtime:6.0'] = {
  'windows' => {
    'package' => 'dotnet-6.0-runtime',
  },
  'ubuntu' => {
    'package' => 'dotnet-runtime-6.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['runtime:latest'] = default['gusztavvargadr_dotnet']['options']['tools']['runtime:7.0']
default['gusztavvargadr_dotnet']['options']['tools']['runtime'] = default['gusztavvargadr_dotnet']['options']['tools']['runtime:latest']

default['gusztavvargadr_dotnet']['options']['tools']['sdk:7.0'] = {
  'windows' => {
    'package' => 'dotnet-7.0-sdk',
  },
  'ubuntu' => {
    'package' => 'dotnet-sdk-7.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['sdk:6.0'] = {
  'windows' => {
    'package' => 'dotnet-6.0-sdk',
  },
  'ubuntu' => {
    'package' => 'dotnet-sdk-6.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['sdk:latest'] = default['gusztavvargadr_dotnet']['options']['tools']['sdk:7.0']
default['gusztavvargadr_dotnet']['options']['tools']['sdk'] = default['gusztavvargadr_dotnet']['options']['tools']['sdk:latest']
