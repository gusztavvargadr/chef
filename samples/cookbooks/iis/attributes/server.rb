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
    '.NET Core 3.1.19 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/c154f72b-dcaf-4852-8fbe-20f0f3c779a7/91c7e664a755fb3142740f14c5c96ea7/dotnet-hosting-3.1.19-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.10 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/a0da9621-68f0-439a-b617-4697ee0669e3/38eb4aa6e879b9f06b73599ea2e1535f/dotnet-hosting-5.0.10-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
