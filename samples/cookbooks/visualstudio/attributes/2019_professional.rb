default['gusztavvargadr_visualstudio']['2019_professional'] = {
  'native_packages' => {
    'Visual Studio 2019 Professional' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/edd01cb1-daeb-4baa-a985-300b686d7051/6f686a18b9d8fbabb0d9e447dc9acad0/vs_professional.exe',
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
      'elevated' => true,
    },
  },
}
