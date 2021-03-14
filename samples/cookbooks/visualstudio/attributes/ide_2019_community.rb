default['gusztavvargadr_visualstudio']['ide']['2019_community'] = {
  'native_packages' => {
    'Visual Studio 2019 Community' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/152e306c-897a-4b67-ac3c-52d15f436c27/14d6d4360aa6a82d1c6df098f0a2aa90/vs_community.exe',
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
      'elevated' => true,
    },
  },
}
