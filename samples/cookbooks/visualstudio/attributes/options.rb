default['gusztavvargadr_visualstudio']['options']['tools']['ide:2022-community'] = {
  'windows' => {
    'features' => {
      'NetFx3$' => {},
    },
    'native_packages' => {
      'Visual Studio 2022 Community' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/dc2793e9-7b80-4f11-9e33-85833e8921a6/3e99b3943dceebd42d08e48c1d86422bce270dac46bb718d4e8e4a61034d52ce/vs_Community.exe',
        'install' => [
          '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\Community""',
          '--add Microsoft.VisualStudio.Workload.CoreEditor',
          '--add Microsoft.VisualStudio.Workload.ManagedDesktop',
          '--add Microsoft.VisualStudio.Workload.NetWeb',
          '--add Microsoft.VisualStudio.Workload.Data',
          '--add Microsoft.VisualStudio.Workload.Azure',
          '--add Microsoft.VisualStudio.Workload.NetCoreTools',
          '--add Microsoft.VisualStudio.Component.TestTools.Core',
          '--add Microsoft.Net.Component.3.5.DeveloperTools',
          '--includeRecommended',
          '--includeOptional',
          '--quiet',
          '--norestart',
        ],
        'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2022/Community/Common7/IDE/devenv.exe',
      },
    },
  },
}

default['gusztavvargadr_visualstudio']['options']['tools']['ide:2022'] = default['gusztavvargadr_visualstudio']['options']['tools']['ide:2022-community']
default['gusztavvargadr_visualstudio']['options']['tools']['ide:latest'] = default['gusztavvargadr_visualstudio']['options']['tools']['ide:2022']
default['gusztavvargadr_visualstudio']['options']['tools']['ide'] = default['gusztavvargadr_visualstudio']['options']['tools']['ide:latest']

default['gusztavvargadr_visualstudio']['options']['tools']['ide:2019-community'] = {
  'windows' => {
    'features' => {
      'NetFx3$' => {},
    },
    'native_packages' => {
      'Visual Studio 2019 Community' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/45dfa82b-c1f8-4c27-a5a0-1fa7a864ae21/9dd77a8d1121fd4382494e40840faeba0d7339a594a1603f0573d0013b0f0fa5/vs_Community.exe',
        'install' => [
          '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community""',
          '--add Microsoft.VisualStudio.Workload.CoreEditor',
          '--add Microsoft.VisualStudio.Workload.ManagedDesktop',
          '--add Microsoft.VisualStudio.Workload.NetWeb',
          '--add Microsoft.VisualStudio.Workload.Data',
          '--add Microsoft.VisualStudio.Workload.Azure',
          '--add Microsoft.VisualStudio.Workload.NetCoreTools',
          '--add Microsoft.VisualStudio.Component.TestTools.Core',
          '--add Microsoft.Net.Component.3.5.DeveloperTools',
          '--includeRecommended',
          '--includeOptional',
          '--quiet',
          '--norestart',
        ],
        'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/devenv.exe',
      },
    },
  },
}

default['gusztavvargadr_visualstudio']['options']['tools']['ide:2019'] = default['gusztavvargadr_visualstudio']['options']['tools']['ide:2019-community']
