default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 2.1.29 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/109ce9a7-02c8-4e3a-a59b-0314cb2ea404/83ec4ae63ecb192f72741bba8c783974/dotnet-hosting-2.1.29-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.18 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/a363a491-56ab-4451-a901-e5886dea2fc6/40595416f34ad49d8a83c2bf83f03487/dotnet-hosting-3.1.18-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.9 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/a0f49856-eec9-4962-8d81-b09af6be9435/1d5fc0083b7f7e10ebed181329ca88ae/dotnet-hosting-5.0.9-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
