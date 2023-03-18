default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET 7.0.4 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/d97e0776-b316-4c41-a067-202eb027b968/e9694b0aa94e4b814f980f9ec3d3f400/dotnet-hosting-7.0.4-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.15 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/e38901ef-e9ac-4331-a6aa-f2aec3b1754b/6d695fa51a4960393edaf725ce970a86/dotnet-hosting-6.0.15-win.exe',
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
