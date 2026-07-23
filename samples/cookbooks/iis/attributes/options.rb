default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {}
    },
    'native_packages' => {
      '.NET 10.0.10 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/10.0.10/dotnet-hosting-10.0.10-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 9.0.18 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/9.0.18/dotnet-hosting-9.0.18-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 8.0.29 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/8.0.29/dotnet-hosting-8.0.29-win.exe',
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
