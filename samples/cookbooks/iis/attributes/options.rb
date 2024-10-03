default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 8.0.8 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/ef1366bd-3111-468b-93da-17e6ccb057e1/1fac364775c1accb09b9ac5314179004/dotnet-hosting-8.0.8-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 6.0.33 Hosting Bundle' => {
        'source' => 'https://download.visualstudio.microsoft.com/download/pr/a154cee6-ab21-409b-8611-fb6c3b5b7513/b7da806505271536441f05ebd59627b2/dotnet-hosting-6.0.33-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
    },
  },
}

default['gusztavvargadr_iis']['options']['tools']['server'] = default['gusztavvargadr_iis']['options']['tools']['server:latest']
