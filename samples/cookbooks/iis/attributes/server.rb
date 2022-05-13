default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET Framework 4.8 Runtime' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/9b7b8746971ed51a1770ae4293618187/ndp48-web.exe',
      'install' => [
        '/q',
        '/norestart',
      ],
    },
    '.NET Core 3.1.25 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/1c12a7f4-1e3b-4d0c-a0f8-a03950187940/15abf24d5330aca4429b6212892ca2ae/dotnet-hosting-3.1.25-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.17 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/05726c49-3a3d-4862-9ff8-0660d9dc3c52/71c295f9287faad89e2d3233a38b44fb/dotnet-hosting-5.0.17-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.4 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/ae1014c7-a005-4a0e-9062-b6f3056ded09/da5d731f5ead9e385427a77412b88fb0/dotnet-hosting-6.0.5-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
