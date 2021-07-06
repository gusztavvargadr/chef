default['gusztavvargadr_visualstudio']['ide']['2017_community'] = {
  'native_packages' => {
    'Visual Studio 2017 Community' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/67f7bfaa-2635-43d9-ba82-26564f458881/39c4a53eca39ef21e54c3d2469197c4fb9bc9728bf9073f66481073b455fbce5/vs_Community.exe',
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
        '--includeRecommended',
        '--includeOptional',
        '--quiet',
        '--norestart',
      ],
      'executable' => 'C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/IDE/devenv.exe',
    },
  },
}
