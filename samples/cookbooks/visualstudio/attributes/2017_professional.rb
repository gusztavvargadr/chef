default['gusztavvargadr_visualstudio']['2017_professional'] = {
  'native_packages' => {
    'Visual Studio 2017 Professional' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/f804a3b3-42d8-4349-8128-a257bbd63e69/52f5532d36c040ebbec00a74fcc22a78/vs_professional.exe',
      'install' => [
        '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Professional""',
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
      'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2017/Professional/Common7/IDE/devenv.exe',
      'elevated' => true,
    },
  },
}
