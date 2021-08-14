default['gusztavvargadr_visualstudio']['ide']['2019_professional'] = {
  'native_packages' => {
    'Visual Studio 2019 Professional' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/9dc321fd-8a9b-47ef-98a9-af0515e08d6f/ee91c8ca6f156f05cbc2be80c0630f1185ba7dfe7f9b1cf5d3915cac8f84bcc7/vs_Professional.exe',
      'install' => [
        '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Professional""',
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
      'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2019/Professional/Common7/IDE/devenv.exe',
    },
  },
}
