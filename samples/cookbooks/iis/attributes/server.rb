default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET 7.0.0 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/8de163f5-5d91-4dc3-9d01-e0b031a03dd9/0170b328d569a49f6f6a080064309161/dotnet-hosting-7.0.0-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.11 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/db07eed5-297a-45b8-bea2-1e93c623a88c/6e5a8d3432e6213f071be3751ae53a08/dotnet-hosting-6.0.11-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.31 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/b84cc7e8-5bf7-4e35-bc2a-94903c823b5c/12f4767bded70bcfb4d56b3a6bfa005d/dotnet-hosting-3.1.31-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
  },
}
