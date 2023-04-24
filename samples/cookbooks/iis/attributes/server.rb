default['gusztavvargadr_iis']['server']['default'] = {
  'features' => {
    'NetFx3$' => {},
    'IIS-WebServer' => {},
    'IIS-ASPNET' => {},
  },
  'native_packages' => {
    '.NET 7.0.5 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/19927e80-7df2-4906-badd-439502008177/cb55d49c06a3691965b4bcf934ead822/dotnet-hosting-7.0.5-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.16 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/7ab0bc25-5b00-42c3-b7cc-bb8e08f05135/91528a790a28c1f0fe39845decf40e10/dotnet-hosting-6.0.16-win.exe',
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
