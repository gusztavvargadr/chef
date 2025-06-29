default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 9.0.6 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/9.0.6/dotnet-hosting-9.0.6-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 8.0.17 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/8.0.17/dotnet-hosting-8.0.17-win.exe',
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
