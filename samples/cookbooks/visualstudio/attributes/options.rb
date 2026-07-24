default['gusztavvargadr_visualstudio']['options']['tools']['ide:2022-community'] = {
  'windows' => {
    'features' => {},
    'native_packages' => {
      'Visual Studio 2022 Community' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/f7f5ecbc-83ca-4cf0-bdb2-aaf70efb6d97/d3cc238063d64e6448afbe4dfd69254af37adb4ff47e158fea2280bcafd098c4/vs_Community.exe',
        'install' => [
          '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\Community""',
          '--add Microsoft.VisualStudio.Workload.CoreEditor',
          '--add Microsoft.VisualStudio.Workload.ManagedDesktop',
          '--add Microsoft.VisualStudio.Workload.NetWeb',
          '--add Microsoft.VisualStudio.Workload.Data',
          '--add Microsoft.VisualStudio.Workload.Azure',
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
