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
    '.NET Core 3.1.24 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/fcedc990-c89d-4c23-a5b3-8380433db590/2ccf44671fe78d1a20ddefa9ef977b80/dotnet-hosting-3.1.24-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.16 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/0e0baacc-0402-4e05-b8e8-c7a50f6efbe5/760f2852ea15c7717668d29f28c7454c/dotnet-hosting-5.0.16-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.4 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/0c2039d2-0072-43a8-bb20-766b9a91d001/0e2288a2f07743e63778416b2367bb88/dotnet-hosting-6.0.4-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
