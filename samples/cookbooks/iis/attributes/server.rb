default['gusztavvargadr_iis']['server'] = {
  'features' => {
    'NetFx3$' => {},
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
    '.NET Core 2.1.16 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5a059308-c27a-4223-b04d-0e815dce2cd0/10f528c237fed56192ea22283d81c409/dotnet-hosting-2.1.16-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.2 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/dd119832-dc46-4ccf-bc12-69e7bfa61b18/990843c6e0cbd97f9df68c94f6de6bb6/dotnet-hosting-3.1.2-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
