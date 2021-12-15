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
    '.NET Core 3.1.22 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/5b681079-0068-4c70-be77-af30f1154a83/cd5d074d8328fbc0b3bebf87c88ae082/dotnet-hosting-3.1.22-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 5.0.13 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/08a0bb65-6004-4099-8289-945f1681d946/f77d62d5e200693bec1416d4aefa97f7/dotnet-hosting-5.0.13-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
    '.NET 6.0.1 Hosting Bundle' => {
      'source' => 'https://download.visualstudio.microsoft.com/download/pr/b69fc347-c3c8-49bc-b452-dc89a1efdf7b/ebac64c8271dab3b9b1e87c72ef47374/dotnet-hosting-6.0.1-win.exe',
      'install' => [
        '/install',
        '/quiet',
        '/norestart',
      ],
    },
  },
}
