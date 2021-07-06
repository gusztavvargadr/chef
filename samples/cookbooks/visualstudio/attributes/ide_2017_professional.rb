default['gusztavvargadr_visualstudio']['ide']['2017_professional'] = {
  'native_packages' => {
    'Visual Studio 2017 Professional' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/67f7bfaa-2635-43d9-ba82-26564f458881/42c2609d6a8cfd6471a3c83163bc0a657216c23c915f9c5580f3b783d7de086d/vs_Professional.exe',
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
    },
  },
}
