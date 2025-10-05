default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 9.0.9 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/9.0.9/dotnet-hosting-9.0.9-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 8.0.20 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/8.0.20/dotnet-hosting-8.0.20-win.exe',
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
