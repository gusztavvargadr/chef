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
    '.NET Core 2.1.28 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/50a47fa0-aff0-44d2-a4ef-0d7c608101e6/3bdef1208816793d6775b6d1912ab81f/dotnet-hosting-2.1.28-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET Core 3.1.16 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/8bc07709-5179-4e00-97c1-7ba838a17896/e509eaa80062bb3cfc94d64a7bf70afb/dotnet-hosting-3.1.16-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.7 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/2a40c007-8ad7-4e80-a334-40bc47851e90/fc13a55a20414ef9689fcf60618c412f/dotnet-hosting-5.0.7-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
