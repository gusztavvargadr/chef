default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET 7.0.7 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/d5d8a7b5-a190-4237-8cc0-6b72d6dd3022/2644b9b70ba39b60e35f6d483d1c9c47/dotnet-hosting-7.0.7-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.18 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/b84943df-6c61-4af8-91fc-a3981cd04eb8/69663d1ee22625a25d9f528b9dde0225/dotnet-hosting-6.0.18-win.exe',
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
