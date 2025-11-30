default['gusztavvargadr_iis']['options']['tools']['server:latest'] = {
  'windows' => {
    'features' => {
      'IIS-WebServer' => {},
      'IIS-ASPNET' => {},
    },
    'native_packages' => {
      '.NET 10.0.0 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/10.0.0/dotnet-hosting-10.0.0-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 9.0.11 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/9.0.11/dotnet-hosting-9.0.11-win.exe',
        'install' => [
          '/install',
          '/quiet',
          '/norestart',
        ],
      },
      '.NET 8.0.22 Hosting Bundle' => {
        'source' => 'https://builds.dotnet.microsoft.com/dotnet/aspnetcore/Runtime/8.0.22/dotnet-hosting-8.0.22-win.exe',
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
