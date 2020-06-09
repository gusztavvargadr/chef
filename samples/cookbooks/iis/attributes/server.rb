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
    '.NET Core 2.1.18 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/95f36881-f24a-4e5a-bff9-74dba1c5ae60/04384e05d0ddf9098288c5c01f79ad01/dotnet-hosting-2.1.18-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 2.2.8 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/ba001109-03c6-45ef-832c-c4dbfdb36e00/e3413f9e47e13f1e4b1b9cf2998bc613/dotnet-hosting-2.2.8-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.0.3 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/18e13f02-1a28-4fe4-b642-6674408c3673/108e75fd84bf9153ea03ed4011252f9b/dotnet-hosting-3.0.3-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.4 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5bed16f2-fd1a-4027-bee3-3d6a1b5844cc/dd22ca2820fadb57fd5378e1763d27cd/dotnet-hosting-3.1.4-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
