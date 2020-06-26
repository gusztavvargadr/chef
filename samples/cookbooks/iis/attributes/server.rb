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
    '.NET Core 2.1.19 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/988d236a-30bf-4e96-8063-665d27c922c9/b793025960eaf182d8f32e723ad9b47a/dotnet-hosting-2.1.19-win.exe',
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
    '.NET Core 3.1.5 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7c30d3a1-f519-4167-b850-b9c49bf2aa0e/dbfa957a76a41a1e1795f59d400d4ccd/dotnet-hosting-3.1.5-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
