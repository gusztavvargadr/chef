default['gusztavvargadr_dotnet']['options']['tools']['runtime:9.0'] = {
  'windows' => {
    'package' => 'dotnet-9.0-runtime',
  },
  'ubuntu' => {
    'package' => 'dotnet-runtime-9.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['runtime:8.0'] = {
  'windows' => {
    'package' => 'dotnet-8.0-runtime',
  },
  'ubuntu' => {
    'package' => 'dotnet-runtime-8.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['runtime:latest'] = default['gusztavvargadr_dotnet']['options']['tools']['runtime:9.0']
default['gusztavvargadr_dotnet']['options']['tools']['runtime'] = default['gusztavvargadr_dotnet']['options']['tools']['runtime:latest']

default['gusztavvargadr_dotnet']['options']['tools']['sdk:9.0'] = {
  'windows' => {
    'package' => 'dotnet-9.0-sdk',
  },
  'ubuntu' => {
    'package' => 'dotnet-sdk-9.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['sdk:8.0'] = {
  'windows' => {
    'package' => 'dotnet-8.0-sdk',
  },
  'ubuntu' => {
    'package' => 'dotnet-sdk-8.0',
  },
}

default['gusztavvargadr_dotnet']['options']['tools']['sdk:latest'] = default['gusztavvargadr_dotnet']['options']['tools']['sdk:9.0']
default['gusztavvargadr_dotnet']['options']['tools']['sdk'] = default['gusztavvargadr_dotnet']['options']['tools']['sdk:latest']
