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
    '.NET Core 3.1.21 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/4f5c5cdc-1354-415b-a3a2-b5c94d6ca6eb/73841934839d13ba91407f3259a8d1b4/dotnet-hosting-3.1.21-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.12 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/bf3abcc3-5461-451c-9dd6-b74491cf0eed/84775adc7e46888289477b5c72e691fd/dotnet-hosting-5.0.12-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.0 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/c5971600-d95e-46b4-b99f-c75dad919237/25469268adf8be3d438355793ecb11da/dotnet-hosting-6.0.0-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
