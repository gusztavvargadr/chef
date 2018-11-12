default['gusztavvargadr_visualstudio']['2017_community'] = {
  'native_packages' => {
    'Visual Studio 2017 Community' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/4035d2dd-2d45-48eb-9104-d4dc7d808a7b/f5675416a31cbf8c29e74d75a1790cf7/vs_community.exe',
      'install' => [
        '--installPath ""C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Community""',
        '--add Microsoft.VisualStudio.Workload.CoreEditor',
        '--add Microsoft.VisualStudio.Workload.ManagedDesktop',
        '--add Microsoft.VisualStudio.Workload.NetWeb',
        '--add Microsoft.VisualStudio.Workload.Data',
        '--add Microsoft.VisualStudio.Workload.Azure',
        '--add Microsoft.VisualStudio.Workload.NetCoreTools',
        '--add Microsoft.VisualStudio.Component.TestTools.Core',
        '--add Microsoft.Net.Component.3.5.DeveloperTools',
        '--add Component.GitHub.VisualStudio',
        '--includeRecommended',
        '--includeOptional',
        '--quiet --norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE/devenv.exe',
      'elevated' => true,
    },
  },
}
