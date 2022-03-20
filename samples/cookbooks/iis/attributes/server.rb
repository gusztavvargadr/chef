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
    '.NET Core 3.1.23 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/8c089b35-4e8d-4eda-b1e9-1267d2240818/4f60c233e5c968a236e853576548f6ae/dotnet-hosting-3.1.23-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.15 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/d7d20e41-4bee-4f8a-a32c-278f0ef8ce1a/f5a0c59b42d01b9fc2115615c801866c/dotnet-hosting-5.0.15-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.3 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/41d7c644-140a-40b5-9eb7-071544b79c65/885b7fa698a2d1d3a79ad363613f8ff2/dotnet-hosting-6.0.3-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
