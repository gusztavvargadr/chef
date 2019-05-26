default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7afca223-55d2-470a-8edc-6a1739ae3252/c9b8749dd99fc0d4453b2a3e4c37ba16/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 1.0.16 / 1.1.13 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/85188c51-c71f-442e-ae3a-f46449564959/690b9e12e7da159576f67afd986b873d/dotnetcore.1.0.16_1.1.13-windowshosting.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.1.11 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/0ad9d7d3-3cca-48e8-a5cc-07a5a6b8a020/820fd44b4eca9f31b11875d75068bb74/dotnet-hosting-2.1.11-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.5 Windows Server Hosting' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/34f4b2a6-c3b8-495c-a11f-6db955f27757/8c340c1a8c25966e39e0c0a4b308dff4/dotnet-hosting-2.2.5-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
